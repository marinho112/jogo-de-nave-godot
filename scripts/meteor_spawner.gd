extends Node

var pre_fabrica = preload("res://Scenes/Inimigos/fabrica_meteoros.tscn")
var fabrica

func _ready():
	fabrica = pre_fabrica.instance()
	pass 

func _on_Timer_timeout():
	var reduc = 1+(game.dificuldade*0.05) 
	get_node("Timer").set_wait_time(rand_range(1.5,3)/reduc)
	var meteoro = fabrica.get_random_meteoro()
	get_owner().add_child(meteoro)
	meteoro.set_global_position(Vector2(rand_range(54,970),-40))
	pass 
