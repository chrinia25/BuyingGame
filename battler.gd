extends Node2D
var playerstats
var enemystats
var player_hp
var enemy_hp
var exp
var playeraf
var enemyaf
var wingold
var globalvariables
var playercharge
var enemycharge
var count
var gameover
# Called when the node enters the scene tree for the first time.
func _ready():
	gameover = false
	count = 0
	playerstats = get_node('/root/main/player/playerstat')
	globalvariables = get_node('/root/main/globalvariables')
	player_hp = 100
	enemy_hp = 100
	enemystats = {'atk' = 10, 'def' = 2, 'maxhp' = 100}
	playercharge = 0
	enemycharge = 0
	wingold = 20
	exp = 0
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if playerstats.stats['atkspd'] == 0:
		playeraf = 99999
	else:
		playeraf = 1 / playerstats.stats['atkspd']
	enemyaf = 3
	if not globalvariables.pause:
		playercharge += delta
		enemycharge += delta
	if playercharge > playeraf:
		playeratk()
		playercharge = 0
	if enemycharge > enemyaf:
		enemyatk()
		enemycharge = 0
	if player_hp < 0:
		_lost()
	if enemy_hp <0:
		_win()
		_reset_battle()
func _reset_battle():
	player_hp = playerstats.stats['maxhp']
	enemy_hp = enemystats['maxhp']
func _enemylevelup():
	for i in ['atk', 'def', 'maxhp']:
		enemystats[i] = int(enemystats[i]*1.5)
		wingold = int(wingold*1.2)
		globalvariables.globaldiff +=1
func _win(): 
	var playergold = get_node('/root/main/player/Inventory')
	playergold.gold += wingold
	exp += 1
	if exp >4:
		exp = 0
		_enemylevelup()
	count += 1
func _lost():
	globalvariables.pause = true
	globalvariables.userpause = false
	gameover = true
func playeratk():
	var def = enemystats['def']
	if randi()%100 < playerstats.stats['crit']:
		def = def*(100-playerstats.stats['critpwr'])/100
	var damage = max((playerstats.stats['atk']-def),1)*5
	enemy_hp -= int(damage)
func enemyatk():
	print('!')
	var basedamage = max(1,(enemystats['atk']-playerstats.stats['def']))
	player_hp -= int(basedamage)
