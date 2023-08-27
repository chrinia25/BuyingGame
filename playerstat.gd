extends Sprite2D
var count = 1
var stats
# Called when the node enters the scene tree for the first time.
func _ready():
	_reset_stats()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	count += delta
	if count > 1:
		count = 0
		_apply_gear()
		print(stats)
func _reset_stats():
	stats = {'atk': 0, 'atkbonus': 0, 'def': 0, 'defbonus':0,'maxhp': 100,'maxhpbonus': 0,'atkspd': 0, 'asbonus': 0, 'crit': 0,'critpwr': 100, 'managen': 0, 'leech': 0, 'extragold': 0, 'special': -1}
func _apply_gear():
	_reset_stats()
	var weapon = get_node('/root/main/player/Inventory/Inventoryslot1/Item')
	var armor = get_node('/root/main/player/Inventory/Inventoryslot2/Item')
	for i in ['atk', 'atkbonus', 'def', 'defbonus','maxhp','maxhpbonus','atkspd', 'asbonus', 'crit','critpwr', 'managen', 'leech', 'extragold', 'special']:
		if not weapon.isempty:
			stats[i] += weapon.stats[i]
		if not armor.isempty:
			stats[i] += armor.stats[i]
	stats['atk'] = int(stats['atk']*(100+stats['atkbonus'])/100)
	stats['def'] = int(stats['def']*(100+stats['defbonus'])/100)
	stats['maxhp'] = int(stats['maxhp']*(100+stats['maxhpbonus'])/100)
