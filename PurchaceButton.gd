extends Button
signal soldout()
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
	self.visible = false
	emit_signal('soldout')
	emit_signal('hideitem')
	
