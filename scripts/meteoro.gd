extends "res://scripts/Classes/classe_inimigo.gd"

var rot = 0
var anim
var incremento = 1

func _inicia():
	vel +=  game.dificuldade * 10
	pontuacao = int(pontuacao*(1+(game.dificuldade/3)))
	vida += game.dificuldade * game.dificuldade
	incremento += (game.dificuldade/20.0) * rand_range(1,2)
	set_scale(get_scale()*incremento)
	rot = rand_range(-vel,vel)
	anim=get_node("anim")
	pass
	
func _process(delta):
	
	set_position(get_position() + Vector2(0,1) * vel * delta)
	rotate(deg2rad(rot) * delta)
	pass

func _destroi():
	anim.stop()
	anim.play("destroy")
	pass
	
func _aplica_dano():
	
	pass
	