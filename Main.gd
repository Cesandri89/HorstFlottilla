extends Node

func _ready():
	$GameLoop.hide()
	$MainMenu.show()
	
	$GameLoop.set_process_input(false)
	$GameLoop.set_process(false)
	
	$GameLoop.get_node("Player").set_process_input(false)
	$GameLoop.get_node("Player").set_process(false)
	
	$MainMenu.set_process_input(true)
	$MainMenu.set_process(true)
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		$GameLoop.hide()
		$MainMenu.show()
	
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	
	
	
		
	
