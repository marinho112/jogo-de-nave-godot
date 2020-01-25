var pre_tiro = preload("res://Scenes/tiro.tscn")
var ultimo_disparo = 0
var nave 
var ajuste_tiro = 0


func _init(nave):
	self.nave=nave
	pass

func dispara(delta,ajuste_tiro):
	self.ajuste_tiro = ajuste_tiro
	if ultimo_disparo <= 0:
		match nave.num_armas:
			1:
				cria_tiro(nave.get_node("posicaoCanhaoC"))
			2:
				cria_tiro(nave.get_node("posicaoCanhaoEI"))
				cria_tiro(nave.get_node("posicaoCanhaoDI"))
			3:
				cria_tiro(nave.get_node("posicaoCanhaoEI"))
				cria_tiro(nave.get_node("posicaoCanhaoC"))
				cria_tiro(nave.get_node("posicaoCanhaoDI"))
			4:
				cria_tiro(nave.get_node("posicaoCanhaoE"))
				cria_tiro(nave.get_node("posicaoCanhaoEI"))
				cria_tiro(nave.get_node("posicaoCanhaoDI"))
				cria_tiro(nave.get_node("posicaoCanhaoD"))
			_:
				cria_tiro(nave.get_node("posicaoCanhaoE"))
				cria_tiro(nave.get_node("posicaoCanhaoEI"))
				cria_tiro(nave.get_node("posicaoCanhaoC"))
				cria_tiro(nave.get_node("posicaoCanhaoDI"))
				cria_tiro(nave.get_node("posicaoCanhaoD"))
				
	atualiza(delta)	

	pass
func atualiza(delta):
	if ultimo_disparo > 0:
		ultimo_disparo -= delta	
	pass
	
func cria_tiro (node):
	var tiro = pre_tiro.instance()
	tiro.vel=nave.vel_tiro
	tiro.dano=nave.dano
	tiro.ajuste_tiro = ajuste_tiro
	tiro.set_rotation_degrees(nave.get_rotation_degrees())
	nave.get_owner().add_child(tiro)
	tiro.set_global_position(node.get_global_position())
	ultimo_disparo = nave.intervalo
	pass