extends Node

var paths = []
var inimigos = []
const PATH_DIR= "res://Path/inimigos/"
const INIMIGO_TEXT_DIR = "res://PNG/Enemies/"

func _ready():
	
	carrega_path()
	carrega_texturas_inimigos()
	pass

func carrega_path():
	var dir = Directory.new()
	dir.change_dir(PATH_DIR)
	dir.list_dir_begin()
	var path_file = dir.get_next()
	while path_file != "": 
		var path = load(PATH_DIR + path_file)
		if path && (path is Curve2D):
			paths.append(path) 
		path_file = dir.get_next()
func random_path():
	return paths[randi()% paths.size()]
	
func carrega_texturas_inimigos():
	var dir = Directory.new()
	dir.change_dir(INIMIGO_TEXT_DIR)
	dir.list_dir_begin()
	var file = dir.get_next()
	while file != "": 
	
		if file.ends_with(".import"):
			file = file.replace(".import", "")
		print(file)	
		
			
		var tex = load(INIMIGO_TEXT_DIR + file)
		if tex && (tex is Texture):
			inimigos.append(tex) 
		file = dir.get_next()		
func random_inimigo():
	return inimigos[(randi()) % inimigos.size()]
	
	
func simplifica_angulo(angulo):
	
	while angulo >= 360 :
		angulo -= 360
	while angulo <= 0:
		angulo += 360
		
	return angulo
	
func remove_negativo(num):
	if num < 0:
		return 0
	else:
		return num	
func modulo (num):
	
	if num <0:
		return -num
	else:
		return num
		
func retorna_valor360(x,rad):

	match rad:
		1:
			if x <=180:
				return 1 - (recursos.modulo(x-90)/90.0)
			else:
				return -(1 - (recursos.modulo(x-270)/90.0))
		2:
			if (x <=270) && (x >=90):
				return 1 - (recursos.modulo(x-180)/90.0)
			elif (x <=270):
				return -(1 -(recursos.modulo(x)/90.0))
			else:
				return -(1 -(recursos.modulo(x-360)/90.0))
		3:
			if x <=180:
				return -(1 - (recursos.modulo(x-90)/90.0))
			else:
				return 1 - (recursos.modulo(x-270)/90.0)
		_:
			if (x <=270) && (x >=90):
				return -(1 - (recursos.modulo(x-180)/90.0))
			elif (x <=270):
				return 1 -(recursos.modulo(x)/90.0)
			else:
				return 1 -(recursos.modulo(x-360)/90.0)