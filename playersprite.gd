extends Sprite2D

var tiltcounter

# Called when the node enters the scene tree for the first time.
func _ready():
	tiltcounter = 0.0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	tiltcounter += delta
	if tiltcounter > 1.0:
		tiltcounter = 0.0
		self.rotation = -self.rotation
