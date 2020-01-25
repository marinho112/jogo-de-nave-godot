extends "res://scripts/Classes/classe_inimigo.gd"

var pre_tiro = preload("res://Scenes/Inimigos/tiro_inigigo.tscn")


func _inicia():
	get_node("Explosion/anim").play("inicial")
	get_node("Sprite").set_texture(recursos.random_inimigo())
	pass

func _ready():
	
	vida += (game.dificuldade * game.dificuldade)
	vel += (game.dificuldade * 20)
	pontuacao = int(pontuacao*(1+(game.dificuldade/4)))
	
	
	pass

func _on_Timer_timeout():
	var tiro=pre_tiro.instance()
	tiro.set_global_position(get_node("Position").get_global_position())
	game.getCamera().add_child(tiro)
	pass 
	
func _destroi():
	get_node("Timer").stop()
	get_node("Explosion/anim").play("explosao")
	pass
	
