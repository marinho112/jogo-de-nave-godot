extends Area2D

var vel= 250
var pontuacao = 100

func _ready():
	set_process(true)
	pass 

func _process(delta):
	set_position(get_position()+Vector2(0,1) * vel * delta)
	pass