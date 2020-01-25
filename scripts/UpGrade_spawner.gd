extends Node

var vel = 400

var pre_upGrades= [preload("res://Scenes/upGrade/UpGradeDano.tscn"),
preload("res://Scenes/upGrade/UpGradeVelocidade.tscn"),
preload("res://Scenes/upGrade/UpGradeInvuneravel.tscn"),
preload("res://Scenes/upGrade/UpGradeTiroAdicional.tscn"),
preload("res://Scenes/upGrade/UpGradeVida.tscn")]

func _ready():
	pass 


func _on_Timer_timeout():
	
	var numero= randi()%20
	var valor
	if (numero >= 0) && (numero<8):
		valor = 0
	if (numero >= 8) && (numero<14):
		valor = 1
	if (numero >= 14) && (numero<17):
		valor = 2
	if (numero >= 17 && (numero<18)):
		valor = 3
	if (numero >= 18):
		valor = 4

	var upGrade = pre_upGrades[valor].instance()
	get_owner().add_child(upGrade)
	upGrade.set_position(Vector2((randi()%824)+100,0))
	
	get_node("Timer").set_wait_time(rand_range(10,15+game.dificuldade))
	get_node("Timer").start()
	
	pass 
