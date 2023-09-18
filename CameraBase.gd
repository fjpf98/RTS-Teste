extends Node3D

const MOVE_MARGIN = 10


func _process(delta):
	var v_size = get_viewport().size
	var mousePosition = get_viewport().get_mouse_position()
	
	if mousePosition.x < MOVE_MARGIN:
		position.x -= 1
	elif mousePosition.x > v_size.x - MOVE_MARGIN:
		position.x += 1
	if mousePosition.y < MOVE_MARGIN:
		position.z -= 1
	elif mousePosition.y > v_size.y - MOVE_MARGIN:
		position.z += 1
	if Input.is_action_just_released('MiddleMouseButton'):
		rotation_degrees += Vector3(0, 90, 0)
	if Input.is_action_just_released('MouseWhellDown'):
		print_debug($Camera.position.distance_to(position))
		if $Camera.position.distance_to(position) < 35:
			$Camera.position += $Camera.global_transform.basis.z * 2
	if Input.is_action_just_released('MouseWhellUp'):
		if $Camera.position.distance_to(position) > 24:
			$Camera.position -= $Camera.global_transform.basis.z * 2
