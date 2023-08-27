extends RichTextLabel

var player

# Called when the node enters the scene tree for the first time.
func _ready():
	player = get_node('../')
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	self.clear()
	var stats = player.stats
	self.add_text('공격력: ' + str(stats['atk']))
	self.add_text('\n')
	self.add_text('공격속도: ' + str(stats['atkspd']))
	self.add_text('\n')
	self.add_text('방어력: ' + str(stats['def']))
	self.add_text('\n')
	self.add_text('최대 체력: ' + str(stats['maxhp']))
	self.add_text('\n')
	self.add_text('크리티컬 확률: ' + str(stats['crit']))
	self.add_text('\n')
	self.add_text('크리티컬 위력: ' + str(stats['critpwr']))
