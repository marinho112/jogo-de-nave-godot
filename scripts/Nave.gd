extends Area2D

var vel = 400
var arma = preload("res://scripts/Classes/tiro_simples.gd").new(self)
var num_armas=1
var intervalo = 0.2
var vel_tiro = 1000
var dano = 1
var duracao_escudo=2
var ajuste_tiro = 0


func _ready():
	set_process(true)
	add_to_group(game.GRUPO_NAVE)
	get_node("Escudo").ativa_escudo(duracao_escudo)
	pass 

func _process(delta):
	movimentar(delta)
	dispara(delta)
	
		

func girar(delta):
	var angulo = get_rotation_degrees()
	var giro = 0
	if Input.is_action_pressed("girar_direita"):
		giro += (rad2deg(1) * (vel/70) * delta)
	
	if Input.is_action_pressed("girar_esquerda"):
		giro -= (rad2deg(1) * (vel/70) * delta)
		pass
	
	angulo = get_rotation_degrees() + giro
	angulo=recursos.simplifica_angulo(angulo)
	
	set_rotation_degrees(angulo)

func dispara(delta):
	if Input.is_action_pressed("tiro"):
		arma.dispara(delta,ajuste_tiro)
	pass

func movimentar(delta):
	var d = 0
	var e = 0
	var f = 0
	var t = 0
	
	girar(delta)
	
	if Input.is_action_pressed("direita"):
		d = 1
	if Input.is_action_pressed("esquerda"):
		e = -1
	if Input.is_action_pressed("traz"):
		t = 1
	if Input.is_action_pressed("frente"):
		f = -1
		
	set_position(get_position() + Vector2((d + e),(f + t)) * vel * delta)
	
	if (get_position().x > 950):
		set_position(Vector2(950,get_position().y))
	if (get_position().x < 74):
		set_position(Vector2(74,get_position().y))
	if (get_position().y > 650):
		set_position(Vector2(get_position().x,650))
	if (get_position().y < 70):
		set_position(Vector2(get_position().x,70))	

	definir_ajuste_tiro()

func definir_ajuste_tiro():
	
	var rotate= get_rotation_degrees()
	var vector = Vector2(0,0)
	var x = 0
	var y = 0
	
	#rotate= recursos.simplifica_angulo(rotate)
	
	if Input.is_action_pressed("direita"):
		x += recursos.retorna_valor360(rotate,3)
		y += recursos.retorna_valor360(rotate,2)
		
	if Input.is_action_pressed("esquerda"):
		x += recursos.retorna_valor360(rotate,1)
		y +=recursos.retorna_valor360(rotate,4)
		
	if Input.is_action_pressed("traz"):
		x += recursos.retorna_valor360(rotate,1)
		y += recursos.retorna_valor360(rotate,4)
		
	if Input.is_action_pressed("frente"):
		x += recursos.retorna_valor360(rotate,3)
		y += recursos.retorna_valor360(rotate,2)
		
	
	ajuste_tiro = Vector2(x,y) * vel/2.0
		
	
func _on_nave_area_entered(area):
	if area.is_in_group(game.GRUPO_INIMIGO):
		retira_vida()
		if area.has_method("aplicaDano"):
			area.aplicaDano(200)
		else:
			area.queue_free()
	elif area.is_in_group(game.GRUPO_TIRO_INIMIGO):
		retira_vida()
		if area.has_method("destroi"):
			area.destroi()
	pass 

func retira_vida():
	if !get_node("Escudo").is_visible():
		game.lifes -= 1
		if game.lifes >= 0:
			get_node("Explosion/anim").play("dano")
		else:
			get_node("Explosion/anim").play("explosao")
