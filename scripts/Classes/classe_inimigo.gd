extends Area2D

export var vel = 200
export var vida = 2
export var pontuacao = 3


func _ready():
	add_to_group(game.GRUPO_INIMIGO)
	set_process(true)
	randomize()
	_inicia()
	pass 
	
func _inicia():
	
	pass


func aplicaDano(valor):
	vida-=valor
	_aplica_dano()
	if vida <= 0:
		remove_from_group(game.GRUPO_INIMIGO)
		game.score+= pontuacao
		set_process(false)
		set_z_index(10)
		game.getCamera().shake()
		get_node("Collision").queue_free() 
		_destroi()
	pass
	
func _aplica_dano():
	pass
func _destroi():
	pass