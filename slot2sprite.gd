extends AnimatedSprite2D

var description
var Item
# Called when the node enters the scene tree for the first time.
func _ready():
	description = get_node('descriptionbox')
func _process(delta):
	if get_viewport().get_mouse_position().x > 457+32:
		description.visible = false
	elif get_viewport().get_mouse_position().x < 457-32:
		description.visible = false
	elif get_viewport().get_mouse_position().y > 447 + 32:
		description.visible = false
	elif get_viewport().get_mouse_position().y < 447 - 32:
		description.visible = false
	else:
		description.visible = true
	
