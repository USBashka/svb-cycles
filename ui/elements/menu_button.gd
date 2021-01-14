tool  # Отображает данные в редакторе
extends Control

class_name MButton, "res://assets/editor_icons/MButton.png"

signal hovered(is_hovered, button)
signal pressed(button)

export var icon_texture: Texture
export var label_text: String
export var action: String

onready var icon = $HBox/Icon
onready var label = $HBox/Label
onready var tween = $Tween


func _ready():
	if icon_texture and label_text:
		icon.texture = icon_texture
		label.text = label_text


func hover():
	icon.modulate = Color.white
	modulate = Color("EFBBD2")
	tween.interpolate_property(icon, "rect_min_size", icon.rect_min_size,
			Vector2(36, 24), 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()

func unhover():
	icon.modulate = Color("e5f45f")
	modulate = Color.white
	tween.interpolate_property(icon, "rect_min_size", icon.rect_min_size,
			Vector2(24, 24), 0.1, Tween.TRANS_LINEAR, Tween.EASE_IN_OUT)
	tween.start()



func _on_MenuButton_mouse_entered():
	emit_signal("hovered", true, self)
	hover()


func _on_MenuButton_mouse_exited():
	emit_signal("hovered", false, self)
	unhover()


func _gui_input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			emit_signal("pressed", self)
			hover()

