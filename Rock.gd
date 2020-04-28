extends Area



var hitpoints : int = 100
export var max_hitpoints : int = 100
var velocity : Vector3

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	velocity = Vector3(rand_range(-2,2),rand_range(-2,2),rand_range(-2,2))

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	transform.origin += velocity * delta	
	
	if hitpoints <= 0:
		print("rock destroyed")
		queue_free()
		
		
		

func _on_Rock_area_entered(area):
	if area.name == "BoundBoxEast" or area.name == "BoundBoxWest":
		#print(velocity)
		velocity = velocity * Vector3(1,1,-1)

	if area.name == "BoundBoxNorth" or area.name == "BoundBoxSouth":
		velocity = velocity * Vector3(-1,1,1)
	
	if area.name == "BoundBoxTop" or area.name == "BoundBoxBottom":
		velocity = velocity * Vector3(1,-1,1)
		
	if area.name == "LaserBeam":
		hitpoints -= area.damage
		area.queue_free()
		print("hit with laser!")
	
	# if colliding with player
	if area.name == "PlayerArea":
		print("A rock has just collided with the Player!")
		queue_free()
	print(area.name)
		
		
		
