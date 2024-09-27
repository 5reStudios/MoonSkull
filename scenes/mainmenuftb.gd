extends Control



func _on_startgame_pressed():
	get_tree().change_scene_to_file("res://scenes/gamelevel1.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/options.tscn")


func _on_quit_pressed():
	get_tree().quit()
