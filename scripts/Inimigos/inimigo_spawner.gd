extends Node
var pre_inimigo= preload("res://Scenes/Inimigos/path_inimigo.tscn") 

func _ready():
	randomize()
	randomize_timer()
	pass 

func randomize_timer():
	var reduc = 1+(game.dificuldade*0.1) 
	get_node("Timer").set_wait_time(rand_range(4,5)/reduc)

func _on_Timer_timeout():
	var inimigo = pre_inimigo.instance()
	get_owner().add_child(inimigo)
	inimigo.set_position(Vector2(randi()%1024,0))
	randomize_timer()
	pass 
	
