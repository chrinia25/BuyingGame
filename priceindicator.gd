extends Sprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	var button = get_node("../Button")
	button.soldout.connect(self.hide)
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var label = get_node('RichTextLabel')
	var Item = get_node('../Item')
	label.text = str(Item.price)
func _hide():
	self.visible = false
