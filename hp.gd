extends RichTextLabel

var playerstat
var battler

# Called when the node enters the scene tree for the first time.
func _ready():
	battler = get_node('/root/main/battler')
	playerstat = get_node('/root/main/player/playerstat')

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var curr_hp = battler.player_hp
	var max_hp = playerstat.stats['maxhp']
	self.clear()
	self.push_color(Color(1, 0, 1, 1))
	self.add_text('hp: ' + str(curr_hp) + '/' + str(max_hp))
	self.pop()
