extends RichTextLabel

var inventory

# Called when the node enters the scene tree for the first time.
func _ready():
	inventory = get_node('../../')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.text = str(inventory.gold)
