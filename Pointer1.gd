extends KinematicBody


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var target
var target_group

# Called when the node enters the scene tree for the first time.
func _ready():
	#pass # Replace with function body.
	target_group = get_tree().get_nodes_in_group("targets")	
	target = target_group[randi() % target_group.size()]


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
#	pass
	#print(target.name)
	var offset = translation - target.translation
	look_at_from_position(translation, target.translation, Vector3.UP)
	rotate_object_local(Vector3.UP, deg2rad(180))
	
