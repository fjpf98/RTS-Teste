extends RigidBody3D


var path = []
var path_index = 0
const move_speed = 12
@onready var nav = get_parent()

func move_to(target_pos):
	path = nav.get_simple_path(global_transform.origin, target_pos)
	path_index = 0
	
func _physics_process(delta: float):
	if path_index < path.size():
		var move_vec = (path[path_index] - global_transform.origin)
		if move_vec.lenght() < 0.1:
			path_index += 1
		else:
			move_and_collide(Vector3(0,1,0) * move_vec.normalized() * move_speed) 
