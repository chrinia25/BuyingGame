extends Node2D

var itemname
var rarity
var stats
var price
var slot 
var description
var itemtype
signal make_item_desc()
var buybutton1
var buybutton2
var shopitem1
var shopitem2
var isempty
func _ready():
	isempty = true
	buybutton1 = get_node('/root/main/shop/ShopSlot3/Button')
	buybutton1.itemsold.connect(getitem1)
	shopitem1 = get_node('/root/main/shop/ShopSlot3/Item')
	buybutton2 = get_node('/root/main/shop/ShopSlot4/Button')
	buybutton2.itemsold.connect(getitem2)
	shopitem2 = get_node('/root/main/shop/ShopSlot4/Item')
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func getitem1():
	isempty = false
	self.visible = true
	itemname = shopitem1.itemname
	rarity = shopitem1.rarity
	stats = shopitem1.stats
	price = shopitem1.price
	description = shopitem1.description
	itemtype = shopitem1.itemtype
	var itembackground = get_node('Background')
	itembackground.frame = rarity
	make_item_desc.emit()
	var itemsprite = get_node('ItemSprite')
	const type_to_num = {'armor':0, 'robe': 1}
	itemsprite.frame = type_to_num[itemtype]
	make_item_desc.emit()
func getitem2():
	isempty = false
	self.visible = true
	itemname = shopitem2.itemname
	rarity = shopitem2.rarity
	stats = shopitem2.stats
	price = shopitem2.price
	description = shopitem2.description
	itemtype = shopitem2.itemtype
	print(rarity)
	var itembackground = get_node('Background')
	itembackground.frame = rarity
	make_item_desc.emit()
	var itemsprite = get_node('ItemSprite')
	const type_to_num = {'armor': 0, 'robe': 1}
	itemsprite.frame = type_to_num[itemtype]
	make_item_desc.emit()
