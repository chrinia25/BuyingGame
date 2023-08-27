extends RichTextLabel


# Called when the node enters the scene tree for the first time.
func _ready():
	var Item = get_node('../../../')
	print(Item)
	Item.make_item_desc.connect(describe)
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func describe():
	self.clear()
	var Item = get_node('../../../')
	var rarity = Item.rarity
	var stats = Item.stats
	var price = Item.price
	var description = Item.description
	if rarity == 0:
		self.push_color(Color('white'))
	elif rarity == 1:
		self.push_color(Color('green'))
	elif rarity == 2:
		self.push_color(Color('light_blue'))
	elif rarity == 3:
		self.push_color(Color('violet'))
	elif rarity == 4:
		self.push_color(Color('orange'))
	self.add_text(Item.itemname)
	self.add_text('\n')
	self.push_color((Color('white')))
	self.add_text('\n')
	self.add_text('==============================')
	self.add_text('\n')
	const raritylist = ['커먼', '언커먼', '레어', '에픽', '레전더리']
	self.add_text(raritylist[rarity]+' 아이템')
	self.add_text('\n')
	self.add_text('가격'+str(int(price))+'g')
	self.add_text('\n')
	if stats['atk'] != 0:
		self.add_text('공격력: ' + str(stats['atk']))
		self.add_text('\n')
	if stats['atkspd'] != 0:
		self.add_text('공격속도: ' + str(stats['atkspd']))
		self.add_text('\n')
	if stats['def'] != 0:
		self.add_text('방어력: ' + str(stats['def']))
		self.add_text('\n')
	if stats['maxhp'] != 0:
		self.add_text('최대 체력: ' + str(stats['maxhp']))
		self.add_text('\n')
	if stats['crit'] != 0:
		self.add_text('크리티컬 확률: ' + str(stats['crit']))
		self.add_text('\n')
	if stats['critpwr'] != 0:
		self.add_text('크리티컬 위력: ' + str(stats['critpwr']))
	self.add_text('\n')
	self.add_text('==============================')
	self.add_text('\n')
	self.add_text(description)
	self.pop
