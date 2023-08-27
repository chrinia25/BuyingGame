extends Node
signal paused()
signal unpaused()
var globaldiff
var pause
var userpause
var pausescreen
# Called when the node enters the scene tree for the first time.
func _ready():
	globaldiff = 1
	pause = true
	userpause = true
	pausescreen = get_node('pausescreen')
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if pause == true and userpause == true:
		pausescreen.visible = true
	else:
		pausescreen.visible = false
func _unhandled_input(event):
	if event is InputEventKey:
		if event.pressed and event.keycode == KEY_SPACE:
			if userpause == true:
				pause = not pause
			
