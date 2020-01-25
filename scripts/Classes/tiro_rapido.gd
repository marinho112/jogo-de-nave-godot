var pre_tiro = preload("res://Scenes/tiro_vermelho.tscn")
var intervalo = 0.1
var ultimo_disparo = 0
var nave 

func _init(nave):
	self.nave=nave
	pass

func dispara(delta):
	if ultimo_disparo <= 0:
		cria_tiro(nave.get_node("posicaoCanhaoC"))
	atualiza(delta)	

	pass
func atualiza(delta):
	if ultimo_disparo > 0:
		ultimo_disparo -= delta	
	pass
	
func cria_tiro (node):
	var tiro = pre_tiro.instance()
	nave.get_owner().add_child(tiro)
	tiro.set_global_position(node.get_global_position())
	ultimo_disparo = intervalo
	pass
	
