extends Sprite2D

var timer
# Called when the node enters the scene tree for the first time.
func _ready():
	timer = get_node('../RefreshTimerText')
	timer.resetstore.connect(slotreset)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
func slotreset():
	var globalvar = get_node('/root/main/globalvariables')
	var button = get_node('Button')
	var soldout = get_node('SoldOut')
	var indicator = get_node('priceindicator')
	var item = get_node('Item')
	var itemsprite = get_node('Item/ItemSprite')
	button.visible = true
	soldout.visible = false
	indicator.visible = true
	item.visible = true
	itemsprite.visible = true
	item._make_random_item('armor', globalvar.globaldiff)
