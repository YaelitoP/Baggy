extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func pause():
	visible = true


func _on_button_2_pressed():
	get_tree().set_pause(false)
	pass # Replace with function body.


func _on_texture_button_pressed():
	get_tree().quit()
	pass # Replace with function body.