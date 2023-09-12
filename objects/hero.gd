extends CharacterBody2D

const speed = 100


var hp = 10
var damage = 4

func _unhandled_input(event):
	if event.is_action_pressed("Click"):
		var destination = get_global_mouse_position()
		print("Click at (%d, %d)"%[destination.x, destination.y])
		var space_state = get_world_2d().direct_space_state
		var query = PhysicsRayQueryParameters2D.create(position, destination)
		var result = space_state.intersect_ray(query)
		if result:
			var collider = result.collider # as CollisionObject2D
			#print("Collider's name is "%collider.name.)
			if collider.name.begins_with("Mob") && position.distance_to(destination) < 24:
				print("you hit it!!")
				collider.hit(damage)s
				if collider.is_dead():
					print("Enemy kaput!")
				else:
					print("still alive!")


func _physics_process(delta):
	get_input()
	move_and_slide()
	
func get_input():
	var attack = Input.get
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
