extends Sprite2D

@onready var quitOnButton: bool = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("ui_accept") and quitOnButton:
		get_tree().quit()
	pass
	
func ending():
	get_tree().set_pause(true)
	quitOnButton = true
	visible = true