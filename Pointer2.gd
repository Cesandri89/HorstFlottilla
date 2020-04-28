extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var angle = 0
var ROTSPEED = 15
export var fov = 45 # field of view angle in degrees (total). 
			 # fov = 90 means pointer sees 90° left and 90° right
var target
var target_group
var rayleft
var rayright
# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	target_group = get_tree().get_nodes_in_group("targets")	
	target = target_group[randi() % target_group.size()]
	rayleft = $FovrayLeft
	rayright = $FovrayRight
	rayleft.rotate_y(deg2rad(fov))
	rayright.rotate_y(-deg2rad(fov))


# Called when the node enters the scene tree for the first time.
#func _ready():#
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var angle_delta = 0
	if Input.is_action_pressed("increase_fov"):
		angle_delta = 1 * delta * 5
		fov += angle_delta
		rayleft.rotate_y(deg2rad(angle_delta))
		rayright.rotate_y(-deg2rad(angle_delta))
	if Input.is_action_pressed("decrease_fov"):
		angle_delta = -1 * delta * 5
		fov += angle_delta
		rayleft.rotate_y(deg2rad(angle_delta))
		rayright.rotate_y(-deg2rad(angle_delta))
		
	var change = false
	if Input.is_action_pressed("rotate_pointer_left"):
		angle = 1 * ROTSPEED * delta
		change = true
	if Input.is_action_pressed("rotate_pointer_right"):
		angle = -1 * ROTSPEED * delta
		change = true
	if change:
		rotate_object_local(Vector3(0,1,0), deg2rad(angle))

	# do all the time

	var a = self.get_transform().basis.z # Pointers forward vector
	var b = (target.get_translation() - self.get_translation()).normalized() # Vector from pointer to target
	if acos(a.dot(b)) <= deg2rad(fov): # If the angle is less than or equal to field of view 
		pass
		#print("Pointer sees target. fov:", fov)
	else:
		pass
		#print("Pointer does not see target. fov:", fov)

#func inside_fov(player_pos, fov):
#	var facing = transform.basis.z
#	var player_to_enemy = player_pos - global_transform.origin
#	var cos_theta = dot(player_to_enemy, facing)
#	return acos(cos_theta)*2.0 < fov
