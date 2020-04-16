extends KinematicBody

#var Dart = preload("res://Missle.gd")
#export (PackedScene) var missle_instance
var laser_beam = preload("res://LaserBeam.tscn")
var missle_seek = preload("res://MissleSeek.tscn")
var SPEED = 10
#var MAXSPEED = 500
var TURNSPEED = 1 # rotating around y axis
var PITCHSPEED = 1 # rotation around x axis
var ROLLSPEED = 1 # rotation around z axis
var STRAFESPEED = 2
#var direction = Vector3(0,0,1) #vector looking at z, axis, like the player at start


# Called when the node enters the scene tree for the first time.
func _ready():
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	pass
	#print( rotation_degrees) # TODO: mod operator % 360
	# --- steering ---
	var thrust  = 0
	var turn = 0
	var debug = false
	if Input.is_action_pressed("ui_forward"):
		thrust += 1
		debug = true
	if Input.is_action_pressed("ui_backward"):
		thrust -= 1
		debug = true
	if Input.is_action_pressed("ui_rotate_right"):
		turn -= 1 
		debug = true
	if Input.is_action_pressed("ui_rotate_left"):
		turn += 1
		debug = true
	if turn != 0:
		rotate_object_local(Vector3(0,1,0), turn * TURNSPEED * delta)
	turn = 0
	if Input.is_action_pressed("ui_tilt_nose_up"):
		turn += 1
		debug = true
	if Input.is_action_pressed("ui_tilt_nose_down"):
		turn -= 1
		debug = true
	if turn != 0:
		rotate_object_local(Vector3(1,0,0), turn * PITCHSPEED * delta)
	turn = 0
	if Input.is_action_pressed("ui_roll_right"):
		turn += 40
		debug = true
	if Input.is_action_pressed("ui_roll_left"):
		turn -= 40
		debug = true
	if turn != 0:
		global_rotate(Vector3(0,0,1), turn * ROLLSPEED * delta)
		
	
	# --- shooting ---
	if Input.is_action_just_pressed("ui_accept"):
		var m = laser_beam.instance()
		m.start($MuzzleRight.global_transform)
		get_parent().add_child(m)

	#----wasd strafing ----
	# ---- x axis 
	if Input.is_action_pressed("ui_a"):
		debug = true
		# --- strafe left global
		#global_translate(Vector3(1*delta*STRAFESPEED, 0,0))
		#the same as:
		#var t = get_transform()
		#t.origin += Vector3(delta,0,0)
		#set_transform(t)
		# ---- strafe left (local) ----
		#var t = get_transform()
		#t.origin += t.basis.x * delta
		#set_transform(t)
		# the same as:
		translate(Vector3(1*delta*STRAFESPEED,0,0))
	
	if Input.is_action_just_pressed("ctr"):
		var m = missle_seek.instance()
		m.start($MuzzleLeft.global_transform)
		get_parent().add_child(m)	
	
	if Input.is_action_pressed("ui_d"):
		debug = true
		translate(Vector3(-1*delta*STRAFESPEED,0,0))
	# ----- z axis (forward/backward)
	if thrust != 0:
		translate(Vector3(0,0,thrust*delta*SPEED))
	# ------ y axis 
	if Input.is_action_pressed("ui_q"):
		#global_translate(Vector3(0, 1*delta*STRAFESPEED, 0))
		debug = true
		translate(Vector3(0, 1*delta*STRAFESPEED, 0))
	if Input.is_action_pressed("ui_e"):
		#global_translate(Vector3(0,-1*delta*STRAFESPEED, 0))	
		debug = true
		translate(Vector3(0, -1*delta*STRAFESPEED, 0))
		
	# -------------- print debug info --------	
	#if debug:
	#	print("position: ", get_transform(), "heading: ", local_direction )
	

# called exactly 60 times per second
#func _physics_process(delta):
#pass
