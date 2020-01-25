extends Node

const GRUPO_INIMIGO = "Inimigos"
const GRUPO_TIRO_INIMIGO = "Tiro Inimigo"
const GRUPO_NAVE = "Nave"
const GRUPO_POWER_UP="PowerUp"

var score= 0 setget setScore
var lifes = 3 setget setLifes
var dificuldade = 0

var parado = false

signal score_changed
signal lifes_changed
signal morte

func _ready():
	randomize()
	pass # Replace with function body.

func getCamera():
	return get_tree().get_root().get_node("main").get_node("Camera")
	pass
	
func setScore(valor):
	if (valor >= 0): 
		score = valor
		emit_signal("score_changed")

func setLifes(valor):
	if (valor < 16): 
		lifes= valor
		emit_signal("lifes_changed")