extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	self.text = '상점 초기화까지 x초 남았습니다'


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var TimerCount = get_node("RefreshTimer").time_left
	self.text = '상점 초기화까지' + str(int(TimerCount)) + '초 남았습니다'
