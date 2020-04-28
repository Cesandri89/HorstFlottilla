extends Area


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var SPEED = 2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):

	if Input.is_action_pressed("target_right"):
		translate(Vector3(1*delta*SPEED,0,0))
	if Input.is_action_pressed("target_left"):
		translate(Vector3(-1*delta*SPEED,0,0))
	if Input.is_action_pressed("target_up"):
		translate(Vector3(0,0,1*delta*SPEED))
	if Input.is_action_pressed("target_down"):
		translate(Vector3(0,0,-1*delta*SPEED))
	if Input.is_action_pressed("target_climb"):
		translate(Vector3(0,1*delta*SPEED,0))
	if Input.is_action_pressed("target_sink"):
		translate(Vector3(0,-1*delta*SPEED,0))
			
		
