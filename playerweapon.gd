extends AnimatedSprite2D


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var weapon = get_node('../../Inventory/Inventoryslot1/Item')
	var weapontype = weapon.itemtype
	if not weapon.isempty:
		const weaponlist ={'sword': 0, 'dagger': 1, 'greatsword': 2, 'wand': 3, 'staff': 4, 'orb': 5}
		self.frame = weaponlist[weapontype]
