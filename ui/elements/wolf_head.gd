extends Spatial


onready var head = $Head

var rand_time = 0


func _process(delta):
	rand_time += delta*(randi()%2)
	head.rotate_y(delta*2)
	head.rotate_z(delta*sin(rand_time))
	head.rotate_x(delta*cos(rand_time))
