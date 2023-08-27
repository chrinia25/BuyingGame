extends Node2D

var itemname
var rarity
var stats
var price
var slot
var description
var sellbutton
var itemtype
signal make_item_desc()
func _ready():
	_make_random_item('armor',1)
	sellbutton = get_node('../Button')
	sellbutton.soldout.connect(hide)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func _make_random_item(targetslot, level):
	itemname = ''
	description = ''
	slot = targetslot
	var rarity_RNG = randi()%100
	if rarity_RNG <= 2:
		rarity = 4
	elif rarity_RNG <= 9:
		rarity = 3
	elif rarity_RNG <= 29:
		rarity = 2
	elif rarity_RNG <= 59:
		rarity = 1
	else:
		rarity = 0
	var material
	if slot == 'weapon':
		var typeRNG = randi()%6
		if typeRNG == 0:
			itemtype = 'dagger'
		elif typeRNG == 1:
			itemtype = 'sword'
		elif typeRNG == 2:
			itemtype = 'greatsword'
		elif typeRNG == 3:
			itemtype = 'wand'
		elif typeRNG == 4:
			itemtype = 'staff'
		elif typeRNG == 5:
			itemtype = 'orb'
	elif slot == 'armor':
		var typeRNG = randi()%2
		if typeRNG == 0:
			itemtype = 'armor'
		elif typeRNG == 1:
			itemtype = 'robe'
	elif slot == 'trinket':
		pass
	elif slot == 'consumable':
		pass
	price = int(10*(1.5**rarity)*(1.2**(level)))
	_generate_item_stats(itemtype, level)
	for basestat in ['atk', 'def', 'maxhp']:
		if stats[basestat] != 0:
			stats[basestat] = stats[basestat]*(1.2**(level-1))
	_generate_item_modifiers(rarity)
	const itemname_kor = {'sword': '검', 'dagger': '단검', 'greatsword': '대검', 'wand': '지팡이', 'staff': '스태프', 'orb': '오브','armor': '갑옷', 'robe': '로브'}
	itemname = itemname + itemname_kor[itemtype] + '+' + str(level-1)
	const raritylist = ['커먼', '언커먼', '레어', '에픽', '레전더리']
	var itembackground = get_node('Background')
	itembackground.frame = rarity
	var itemsprite = get_node('ItemSprite')
	const type_to_num = {'armor': 0, 'robe': 1}
	itemsprite.frame = type_to_num[itemtype]
	make_item_desc.emit()
func _generate_item_stats(itemtype, level):
	stats = {'atk': 0, 'atkbonus': 0, 'def': 0, 'defbonus':0,'maxhp': 0,'maxhpbonus': 0,'atkspd': 0, 'asbonus': 0, 'crit': 0,'critpwr': 0, 'managen': 0, 'leech': 0, 'extragold': 0, 'special': -1}
	if itemtype == 'dagger':
		stats['atk'] += 10
		stats['crit'] += 10
		stats['atkspd'] += 1
		stats['managen'] += 1
	elif itemtype == 'sword':
		stats['atk'] += 10
		stats['def'] += 10
		stats['atkspd'] += 1
		stats['managen'] += 1
	elif itemtype == 'greatsword':
		stats['atk'] += 15
		stats['atkspd'] += 0.5
		stats['managen'] += 1.5
	elif itemtype == 'wand':
		stats['atk'] += 5
		stats['atkspd'] += 2
		stats['managen'] += 1
	elif itemtype == 'staff':
		stats['atk'] += 5
		stats['def'] += 5
		stats['atkspd'] += 1
		stats['managen'] += 1
	elif itemtype == 'orb':
		stats['atk'] += 5
		stats['atkspd'] += 0.5
		stats ['managen'] += 10
	elif itemtype == 'armor' :
		stats['maxhp'] += 200
		stats['def'] += 30
	elif itemtype == 'robe' :
		stats['maxhp'] += 100
		stats['def'] += 10
		stats['managen'] += 1
func _generate_item_modifiers(rarity):
	var modifierRNG
	if rarity == 4:
		modifierRNG = randi()%6
		const legendmodifier = ['손선빈이 유기한', '남윤호가 사기친', '윤명진이 충동구매한', '송준상이 횡령한', '오인혁이 탐내는', '김우진의 손길이 담긴']
		itemname += legendmodifier[modifierRNG]
		itemname += ' '
		const legenddesc =['사망 시 아이템이 파괴되는 대신 즉시 부활하고 적을 처치합니다', '5% 확률로 적의 방어력을 완전히 무시합니다', '이 아이템은 윤명진이 전설아이템인줄 알고 구매했습니다', '전투 종료 시 50% 확률로 돈을 두 배로 획득합니다', '스킬이 두 번 발동됩니다', '아이템 교체 시 구매 비용을 돌려받습니다']
		description += legenddesc[modifierRNG]
		description += '\n'
		stats['special'] = modifierRNG
	if rarity >= 3:
		modifierRNG = randi()%6
		const epicmodifier = ['굶주린', '탐욕스러운', '치명적인', '무자비한', '놀라운', '재빠른']
		itemname += epicmodifier[modifierRNG]
		itemname += ' '
		const epicdesc =['피해량의 10%를 흡수합니다', '획득하는 골드가 10% 증가합니다', '치명타 확률이 10% 증가합니다', '치명타 위력이 50%p증가합니다', '공격 시 1의 마나를 추가로 회복합니다', '공격 속도가 20% 빨라집니다']
		description += epicdesc[modifierRNG]
		description += '\n'
		if modifierRNG == 0:
			stats['leech'] += 10
		elif modifierRNG == 1:
			stats ['extragold'] += 10
		elif modifierRNG == 2:
			stats['crit'] += 10
		elif modifierRNG == 3:
			stats['critpwr'] += 50
		elif modifierRNG == 4:
			stats['managen'] += 1
		elif modifierRNG == 5:
			stats['asbonus'] += 20
	if rarity >= 2:
		modifierRNG = randi()%6
		const raremodifier = ['광전사의', '거인의', '수호자의', '전사의', '싸움꾼의', '기사의']
		itemname += raremodifier[modifierRNG]
		itemname += ' '
		const raredesc = ['공격력이 10% 증가합니다', '체력이 10% 증가합니다', '방어력이 10% 증가합니다', '공격력, 체력이 5% 증가합니다', '방어력, 체력이 5% 증가합니다', '공격력, 방어력이 5% 증가합니다']
		description += raredesc[modifierRNG]
		description += '\n'
		if modifierRNG == 0:
			stats['atkbonus'] += 10
		elif modifierRNG == 1:
			stats['maxhpbonus'] += 10
		elif modifierRNG == 2:
			stats['defbonus'] += 10
		elif modifierRNG == 3:
			stats['atkbonus'] += 5
			stats['maxhpbonus'] += 5
		elif modifierRNG == 4:
			stats['defbonus'] += 5
			stats['maxhpbonus'] += 5
		elif modifierRNG == 5:
			stats['atkbonus'] += 5
			stats['defbonus'] += 5
	if rarity >= 1:
		modifierRNG = randi()%5
		const ucmodifier = ['날카로운', '거대한', '튼튼한', '가성비 좋은', '행운의']
		itemname += ucmodifier[modifierRNG]
		itemname += ' '
		const ucdesc = ['아이템의 공격력이 10% 증가합니다', '아이템의 체력이 10% 증가합니다', '아이템의 방어력이 10% 증가합니다','가격이 10% 감소되었습니다','크리티컬 확률이 1% 증가합니다']
		description += ucdesc[modifierRNG]
		if modifierRNG == 0:
			stats['atk'] = int(stats['atk']*1.1)
		elif modifierRNG == 1:
			stats['maxhp'] = int(stats['maxhp']*1.1)
		elif modifierRNG == 2:
			stats['def'] = int(stats['def']*1.1)
		elif modifierRNG == 3:
			price = int(price*0.9)
		elif modifierRNG == 4:
			stats['crit'] +=1
