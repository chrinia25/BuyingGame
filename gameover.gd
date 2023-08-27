extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var battler
	battler = get_node('../../')
	self.clear()
	self.push_color(Color(1, 0, 1, 1))
	self.add_text('게임 오버. 점수: ' + str(battler.count))
	self.pop()

