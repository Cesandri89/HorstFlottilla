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

var MOUSE_SENSITIVITY = 0.05
#var direction = Vector3(0,0,1) #vector looking at z, axis, like the player at start
var cameraFollowActive
var rotation_helper = $Camera

# Called when the node enters the scene tree for the first time.
func _ready():
	#print(Globals)
	rotation_degrees = Vector3.ZERO
	cameraFollowActive = true
	
	
func _input(event):
	if event is InputEventKey:
		if event.scancode != KEY_S or event.scancode != KEY_W:
			$MotorParticles.emitting = false
		elif event.scancode == KEY_S or event.scancode == KEY_W:
			$MotorParticles.emitting = true
	if event is InputEventMouseMotion and Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		rotation_helper.rotate_x(deg2rad(event.relative.y * MOUSE_SENSITIVITY))
		self.rotate_y(deg2rad(event.relative.x * MOUSE_SENSITIVITY * -1))

		var camera_rot = rotation_helper.rotation_degrees
		camera_rot.x = clamp(camera_rot.x, -70, 70)
		rotation_helper.rotation_degrees = camera_rot	
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	pass
	#print( rotation_degrees) # TODO: mod operator % 360
	# --- steering ---
	var thrust  = 0
	var turn = 0
	var debug = false
	
	if cameraFollowActive:
		if Input.is_action_pressed("ui_forward"):
			thrust += 3
			debug = true
			$MotorParticles.emitting = true
		if Input.is_action_pressed("ui_backward"):
			thrust -= 2
			debug = true
			$MotorParticles.emitting = false
		if Input.is_action_pressed("ui_a"):
			debug = true
			translate(Vector3(1*delta*STRAFESPEED,0,0))
		if Input.is_action_pressed("ui_d"):
			debug = true
			translate(Vector3(-1*delta*STRAFESPEED,0,0))	
		if Input.is_action_pressed("ui_rotate_right"):
			turn -= 3 
			debug = true
			#$AnimationPlayer.play("rotate_right")
			#$CPUParticles.emitting = false
	
		if Input.is_action_pressed("ui_rotate_left"):
			turn += 3
			debug = true
			#$AnimationPlayer.play("rotate_left")
			#$CPUParticles.emitting = false
	
		if turn != 0:
			rotate_object_local(Vector3(0,1,0), turn * TURNSPEED * delta)
		turn = 0
		if Input.is_action_pressed("ui_up"):
			turn += 3
			debug = true
			#$CPUParticles.emitting = false
	
		if Input.is_action_pressed("ui_down"):
			turn -= 3
			debug = true
			#$CPUParticles.emitting = false
	
		if turn != 0:
			rotate_object_local(Vector3(1,0,0), turn * PITCHSPEED * delta)
		turn = 0
		if Input.is_action_pressed("ui_roll_right"):
			print("rolling right...")
			turn += 1
			debug = true
		if Input.is_action_pressed("ui_roll_left"):
			turn -= 1
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
		#if Globals.player_health <= 0:
		#	$ExplosionParticles.emitting = tru
		if Input.is_action_just_pressed("ctr"):
			var m = missle_seek.instance()
			m.start($MuzzleLeft.global_transform)
			get_parent().add_child(m)
	# -------------- print debug info --------	
	#if debug:
	#	print("position: ", get_transform(), "heading: ", local_direction )
	if translation.x > 25:
		translation.x = 25
	if translation.x < -25:
		translation.x = -25
		
	if translation.z > 25:
		translation.z = 25
	if translation.z < -25:
		translation.z = -25
	
	if translation.y > 25:
		translation.y = 25
	if translation.y < -25:
		translation.y = -25
	#if translation.x > 25:
	#	translation.x = 25
	
	
	print(translation.x)
	





func _on_Area_area_entered(area):
	pass
	#if area.name == "BoundBoxEast" or area.name == "BoundBoxWest":
		
	#print(velocity)
		
	#if area.name == "BoundBoxNorth" or area.name == "BoundBoxSouth":
		
	#if area.name == "BoundBoxTop" or area.name == "BoundBoxBottom":
		
