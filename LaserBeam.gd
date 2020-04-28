extends Area

var speed = 40
var velocity = Vector3()
export var damage : int = 50

# straight-shooting missle, ends if timer (2s) runs out

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

func start(xform):
	transform = xform
	velocity = transform.basis.z * speed

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	pass
	
	transform.origin += velocity * delta
	#if delta > 2:
		




func _on_Timer_timeout():
	#pass # Replace with function body.
	queue_free()


func _on_LaserBeam_area_entered(area):
	#print("I just collided with: ", area.name)
	if "BoundBox" in area.name:
		print("The laser is dying")
		#print("Box" in area.name)
		queue_free()
		
		
		
	
	
	
