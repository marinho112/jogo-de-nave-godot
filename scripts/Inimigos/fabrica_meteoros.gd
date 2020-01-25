extends Node

func get_meteoro(valor):
	return get_children()[valor].duplicate()
	pass

func get_random_meteoro():
	return get_meteoro(randi() % get_children().size())