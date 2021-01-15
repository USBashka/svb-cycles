extends Control


export onready var tip_label = $VBoxContainer/TipLabel
export(Resource) var tips = preload("res://res/strings/ru/tips.tres")


func _ready():
	randomize()
	update_tip()

func _input(event):
	if event.is_pressed():
		update_tip()

func update_tip():
	tip_label.text = "Савет:\n" + tips.rand_string()
