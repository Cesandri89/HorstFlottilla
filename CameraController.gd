extends Camera


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
#func _ready():
#	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass




export var SPEED : int = 10
#var MAXSPEED = 500
var TURNSPEED = 1 # rotating around y axis
var PITCHSPEED = 1 # rotation around x axis
var ROLLSPEED = 1 # rotation around z axis
#var STRAFESPEED = 2
#var direction = Vector3(0,0,1) #vector looking at z, axis, like the player at start
var cameraControllerActive

# Called when the node enters the scene tree for the first time.
func _ready():
	cameraControllerActive = false
	
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	pass
	#print( rotation_degrees) # TODO: mod operator % 360
	# --- steering ---
	var thrust  = 0
	var turn = 0
	var debug = false
	if cameraControllerActive:
		if Input.is_action_pressed("Camera_right"):
			translate(Vector3(1*delta*SPEED,0,0))
		if Input.is_action_pressed("Camera_left"):
			translate(Vector3(-1*delta*SPEED,0,0))
		if Input.is_action_pressed("Camera_up"):
			translate(Vector3(0,1*delta*SPEED,0))
		if Input.is_action_pressed("Camera_down"):
			translate(Vector3(0,-1*delta*SPEED,0))
		if Input.is_action_pressed("Camera_climb"):
			translate(Vector3(0,0,1*delta*SPEED))
		if Input.is_action_pressed("Camera_sink"):
			translate(Vector3(0,0,-1*delta*SPEED))
	#if Input.is_action_pressed("Camera_tilt_up"):
	#	rotate_object_local(Vector3(1,0,0), 1 * SPEED * delta)
	#if Input.is_action_pressed("Camera_tilt_down"):
	#	rotate_object_local(Vector3(1,0,0), - 1 * SPEED * delta)
		
	
	
		
	
	
	# -------------- print debug info --------	
	#if debug:
	#	print("position: ", get_transform(), "heading: ", local_direction )
	

# called exactly 60 times per second
#func _physics_process(delta):
#pass
