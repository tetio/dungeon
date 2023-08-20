extends Node2D

const wall_resource = preload("res://objects/wall.tscn")
const floor_resource = preload("res://objects/floor.tscn")
const hero_resource = preload("res://objects/hero.tscn")
const mob_resource = preload("res://objects/mob.tscn")
const tile_size = 16
const spawn_point = Vector2(10*tile_size, 10*tile_size)


# Called when the node enters the scene tree for the first time.
func _ready():
	make_room(Vector2(16, 16), 30, 30)
#	var mob = mob_resource.instantiate()
#	mob.position = Vector2(20*tile_size, 15*tile_size)
#	add_child(mob)
	var hero = hero_resource.instantiate()
	hero.position = Vector2(10*tile_size, 15*tile_size)
	add_child(hero)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func make_room(pos, width, height):
	for x in range(0, width):
		for y in range(0, height):
			var floor = floor_resource.instantiate()
			floor.position = Vector2(pos.x + x*tile_size, pos.y + y*tile_size)
			add_child(floor)
	for x in range(-1, width+1):
		var north_wall = wall_resource.instantiate()
		north_wall.position = Vector2(pos.x + x*tile_size, pos.y-1 * tile_size)
		add_child(north_wall)
		var south_wall = wall_resource.instantiate()
		south_wall.position = Vector2(pos.x + x*tile_size, pos.y+1+height * tile_size)
		add_child(south_wall)
	for y in range(0, height):
		var east_wall = wall_resource.instantiate()
		east_wall.position = Vector2(pos.x - tile_size, pos.y + y*tile_size)
		add_child(east_wall)
		var west_wall = wall_resource.instantiate()
		west_wall.position = Vector2(pos.x + width * tile_size, pos.y + y * tile_size)
		add_child(west_wall)


func _on_timer_timeout():
	var mob = mob_resource.instantiate()
	mob.position = spawn_point
	print('Mob name: [%s]'%mob.name)
	add_child(mob)
