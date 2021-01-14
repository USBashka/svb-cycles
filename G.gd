extends Node  # Глобальный скрипт G


func _ready():
	print(OS.get_user_data_dir())


func _input(event):
	if event.is_action_pressed("toggle_fullscreen"):
		OS.window_fullscreen = !OS.window_fullscreen

func is_mobile():
	return OS.get_name() in ["Android", "iOS"]

func is_web():
	return OS.get_name() == "HTML5"
