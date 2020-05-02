extends KinematicBody


var target
var target_group

# Called when the node enters the scene tree for the first time.
func _ready():
	target_group = get_tree().get_nodes_in_group("targets")
	target = target_group[randi() % target_group.size()]
	
func _process(delta):
	var a = self.get_transform().basis.z
	var b = (target.get_translation() - self.get_translation().normalized())
	print("angle cannon to target: ", rad2deg(acos(a.dot(b))))
