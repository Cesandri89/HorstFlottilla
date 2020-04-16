extends Area

var speed = 15
var velocity = Vector3()

# straight-shooting missle, ends if timer (2s) runs out

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var target_group
var target
var timer = 0

func start(xform):
	transform = xform
	velocity = transform.basis.z * speed
	
# Called when the node enters the scene tree for the first time.
func _ready():
	target_group = get_tree().get_nodes_in_group("targets")	
	
	target = target_group[randi() % target_group.size()]
	#print(target_group)
	#print(target.name)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	pass	
	timer += delta
	if timer > 5:
		print("queque free!")
		queue_free()
		
	
	elif timer > 1:
		var offset = translation - target.translation	
		velocity = -offset.normalized() * speed

	transform.origin += velocity  * delta
		
	
