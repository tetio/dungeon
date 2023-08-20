extends CharacterBody2D

const speed = 100


func _unhandled_input(event):
	if event.is_action_pressed("Click"):
		var destination = get_global_mouse_position()
		print("Click at (%d, %d)"%[destination.x, destination.y])
		var space_state = get_world_2d().direct_space_state
		var query = PhysicsRayQueryParameters2D.create(position, destination)
		var result = space_state.intersect_ray(query)
		if result && "mob" in result.collider.name && position.distance_to(destination) < 24:
			print("you hit it!!")

func _physics_process(delta):
	get_input()
	move_and_slide()
	
func get_input():
	var attack = Input.get
	var input_direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_direction * speed
	
