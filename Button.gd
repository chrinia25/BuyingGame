extends Button
signal soldout()
signal itemsold()
# Called when the node enters the scene tree for the first time.
func _ready():
	var button = Button.new()
	button.text = "사기"
	button.pressed.connect(self._button_pressed)
	add_child(button)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _button_pressed():
	var Item = get_node('../Item')
	var Inventory = self.get_node('/root/main/player/Inventory')
	if Item.price <= Inventory.gold:
		Inventory.gold -= Item.price
		self.visible = false
		emit_signal('soldout')
		emit_signal('itemsold')
