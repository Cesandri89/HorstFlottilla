extends Area

var speed = 7
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
	#print("missletimer:", timer)
#	pass	
	timer += delta
	if timer > 15:
		print("queque free!")
		queue_free()
	elif timer > 1:
		var offset = translation - target.translation
		look_at_from_position(translation, target.translation, Vector3.UP)
		rotate_object_local(Vector3.UP, deg2rad(180))		
		velocity = -offset.normalized() * speed 
		if timer < 2:
			# little pause 1 second
			return 
	
	
	transform.origin += velocity * delta	
	
		#if timer > 1:
		#	var offset = translation - target.translation  
		#	#print(target.translation)
		#	#translation += offset
		#	#print(offset)
		#	#else:	
		#	transform.origin += offset * velocity  * delta
		#else:
		#	transform.origin += velocity * delta	
		


