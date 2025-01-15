extends Control

@onready var button: Node = $VBoxContainer/HBoxContainer/Button2
@onready var audio = $AudioStreamPlayer


@onready var retry: = preload("res://SFX/retryButton.mp3")
@onready var exit: = preload("res://SFX/ExitButton.wav")


func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("left") and self.visible == true:
		button.grab_focus()
	pass


func pause():
	visible = true


func _on_button_2_pressed():
	audio.set_stream(retry)
	audio.play()
	await get_tree().create_timer(0.2).timeout 
	get_tree().set_pause(false)
	visible = false
	for node in get_tree().get_nodes_in_group("player"):
		node.stop = false
	pass # Replace with function body.


func _on_texture_button_pressed():
	audio.set_stream(exit)
	audio.play()
	get_tree().quit()
	pass # Replace with function body.
