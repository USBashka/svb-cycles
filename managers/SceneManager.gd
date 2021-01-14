extends Node

var MainMenu: PackedScene = preload("res://ui/main_menu.tscn")
#var Level: PackedScene = preload("res://scenes/room0.tscn")


func _ready():
	var Menu = MainMenu.instance()
	#var ls = Level.instance()
	#call_deferred("add_scene", ls)
	call_deferred("add_scene", Menu)
	
	

func add_scene(scene: Node):
	get_tree().root.add_child(scene)
