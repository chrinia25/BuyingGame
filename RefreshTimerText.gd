extends RichTextLabel

var TimerCount
var globalvariables
signal resetstore()
# Called when the node enters the scene tree for the first time.
func _ready():
	TimerCount = 10
	globalvariables = get_node('/root/main/globalvariables')
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if globalvariables.pause == false:
		TimerCount -= delta
		if TimerCount < 0:
			resetstore.emit()
			TimerCount = 10
	self.clear()
	if TimerCount > 5:
		self.push_color(Color(1, 1, 1, 1))
	else:
		self.push_color(Color(1, 0, 0, 1))
	
	self.add_text('상점 초기화까지'+ str(int(TimerCount))+'초 남았습니다')
	self.pop()
