extends Control


export(int, -1, 7) var current_button: int = -1

onready var buttons = $Buttons


func _ready():
	if G.is_mobile() or G.is_web():
		# В мобильных и веб версиях не нужна кнопка выхода
		$Buttons/Exit.queue_free()
	if !G.is_mobile():
		$Background.stream = load("res://assets/videos/menu_sqiland.webm")
		$Background.play()
	
	for button in buttons.get_children():
		# Сбор сигналов со всех кнопок
		button.connect("hovered", self, "_on_Button_hovered")
		button.connect("pressed", self, "_on_Button_pressed")


func _on_Background_finished():
	# При завершении видеофона включить его заного
	$Background.play()

func _on_Button_hovered(is_hovered: bool, button: Node):
	if is_hovered:
		buttons.get_children()[current_button].unhover()
		current_button = button.get_index()
	else:
		if button.get_index() == current_button:
			current_button = -1

func _on_Button_pressed(button: Node):
	if current_button != button.get_index():
		buttons.get_children()[current_button].unhover()
		current_button = button.get_index()
	var action = button.action
	if has_method(action):
		call_deferred(action)


func next_button():
	if current_button < buttons.get_child_count()-1:
		if current_button > -1:
			buttons.get_children()[current_button].unhover()
		current_button += 1
		buttons.get_children()[current_button].hover()

func previous_button():
	if current_button > 0:
		if current_button < buttons.get_child_count():
			buttons.get_children()[current_button].unhover()
		current_button -= 1
		buttons.get_children()[current_button].hover()

func _input(event):
	if event.is_action_pressed("ui_down"):
		next_button()
	if event.is_action_pressed("ui_up"):
		previous_button()
	if event.is_action_pressed("ui_accept"):
		if current_button > -1:
			var action = buttons.get_children()[current_button].action
			if has_method(action):
				call_deferred(action)


func exit():
	get_tree().quit()
	
func play():
	get_tree().change_scene("res://scenes/room0.tscn")
