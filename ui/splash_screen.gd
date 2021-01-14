extends ColorRect


onready var smols: Node = $SmolS
onready var bigs: Node = $BigS


func setSF(frame: int):
	# Устанавливает текущий кадр для маленькой Савы
	smols.texture.current_frame = frame
	
func setBF(frame: int):
	# Устанавливает текущий кадр для большой Савы
	bigs.texture.atlas.current_frame = frame
