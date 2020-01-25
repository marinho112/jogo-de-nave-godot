extends Path2D

onready var follow = get_node("follow")
var vel



func _ready():
	set_process(true)
	randomize()
	set_curve(recursos.random_path())
	vel=get_node("follow/Inimigo01").vel
	pass 
	
func _process(delta):
	
	follow.set_offset(follow.get_offset() + vel * delta)
	if follow.get_unit_offset() >= 1:
		queue_free()
	if !has_node("follow/Inimigo01") :
		queue_free()
		
