
class_name StringsSet, "res://assets/editor_icons/StringsSet.png"
extends Resource
# Множество строк, порядок которых не важен


export(String, MULTILINE) var description
export(PoolStringArray) var strings


func rand_string():
	# Возвращает случайную строку
	return strings[randi() % strings.size()]
