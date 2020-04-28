extends Spatial


export (PackedScene) var rock_scene
export var rock_amount : int

func _ready():
	randomize()	
	get_node("Player/Camera").current = true
	# spawn random rocks
	for x in range(rock_amount):
		var rock = rock_scene.instance()
		get_node("RockContainer").add_child(rock)
	
	#apply random position, rotation and scale on rocks
	for rock in get_node("RockContainer").get_children():
		rock.translation = Vector3(rand_range(-20,20),
			rand_range(0,20),rand_range(-20,20))
		print("rock translation: ",rock.translation)
		rock.scale = Vector3(rand_range(0.1,2),rand_range(0.1,2),rand_range(0.1,2))	
		rock.rotation_degrees = Vector3(rand_range(0,360),rand_range(0,360), rand_range(0,360))		
		
			
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#change game view ( key_c )
	if Input.is_action_just_pressed("key_c"):
		if $Player/Camera.current:
			$CameraController.current = true
			$CameraController.cameraControllerActive = true
			$Player.cameraFollowActive = false
		else:
			$Player/Camera.current = true
			$CameraController.cameraControllerActive = false
			$Player.cameraFollowActive = true
			
			
			
			
func _input(event):
	#if esc key is pressed and mouse is visible the game should quit
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT: #if mouse left button clicked
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED) # mouse is hidden and captured by the game screen
	elif event is InputEventKey:
								
		#get_tree().quit() #quit the game 
		if event.scancode == KEY_ESCAPE: #if key esc pressed
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE) #set mouse to visible
			



		
		
		
