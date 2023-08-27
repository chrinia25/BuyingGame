extends Sprite2D

var original_pos
var globalvar
# Called when the node enters the scene tree for the first time.
func _ready():
	original_pos = self.position.x
	globalvar = get_node('/root/main/globalvariables')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if globalvar.pause == false:
		self.position.x -= delta*200
		if self.position.x < original_pos - 895:
			self.position.x = original_pos
