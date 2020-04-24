extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var rock_container = get_node("RockContainer")

# Called when the node enters the scene tree for the first time.
func _ready():
	for rock in rock_container.get_children():
		print(rock)
		rock.translation = Vector3(rand_range(0,40),
		rand_range(0,40), rand_range(0,40))
		
	#get_node("AnimationPlayer").play("move_target")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
