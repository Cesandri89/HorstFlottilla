extends Control

func _ready():
	pass

 
func _process(delta):
	pass




func _on_PlayButton_button_down():
	hide()
	Globals.main_menu_active = false
	#Main.get_node("MainMenu").hide()
	#Main.get_node("GameLoop").get_node("Player").set_process_input(true)
#	Main.get_node("MainMenu").set_process(false)
#	Main.get_node("MainMenu").set_process_input(false)
#
	


func _on_ExitButton_button_down():
	get_tree().quit()
