extends Area2D

const GIRO =200
var vel = 300 + (game.dificuldade*10)
const DIR = Vector2(0,1)


func _ready():
	add_to_group(game.GRUPO_TIRO_INIMIGO)
	set_process(true)
	pass
	
func _process(delta):
	rotate(deg2rad(GIRO) * delta)
	translate(DIR * vel * delta)
	
func destroi():
	queue_free()