extends Area2D

export var vel = 0
var dano =0
var nave
var ajuste_tiro = 0

func _ready():
	set_process(true)
	
	pass 
	


func _process(delta):
	
	set_position(get_position() + ((direcao_tiro(self) * vel)+ ajuste_tiro)* delta)
	if(get_position().y < -30):
		queue_free()
	 
	pass

func _on_tiro_area_entered(area):
	if area.is_in_group(game.GRUPO_INIMIGO):
		if area.has_method("aplicaDano"):
			area.aplicaDano(dano)
		else:
			area.queue_free()
		queue_free()
	pass 
	
func direcao_tiro(tiro):
	var rotate= tiro.get_rotation_degrees()
	var position = tiro.get_global_position()
	var vel = tiro.vel
	var x = 0
	var y = 0
	
	rotate= recursos.simplifica_angulo(rotate)
	
	if (rotate>=0) && (rotate<=90):
		x = (rotate/90)
		y = -1+x
		
	elif (rotate> 90) && (rotate<=180):
		x = 2-(rotate/90)
		y = 1-x
	elif (rotate>180) && (rotate<=270):
		x = -((rotate-180)/90)
		y = 1+x
		
	elif (rotate>270) && (rotate<=360):
		x = -(2-((rotate-180)/90))
		y = -1-x
	return Vector2(x,y)