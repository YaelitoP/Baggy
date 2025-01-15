extends Control

@onready var anim: Node = $VBoxContainer/HBoxContainer/Button/AnimatedSprite2D
@onready var button: Node = $VBoxContainer/HBoxContainer/Button
@onready var audio = $AudioStreamPlayer

@onready var retry: = preload("res://SFX/retryButton.mp3")
@onready var exit: = preload("res://SFX/ExitButton.wav")
@onready var crash: = preload("res://SFX/death.mp3")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("left") and self.visible == true:
		button.grab_focus()
	pass

func death():
	get_tree().set_pause(true)
	audio.set_stream(crash)
	audio.play()
	visible = true

func _on_button_focus_entered():
	anim.play("default")
	pass # Replace with function body.


func _on_button_focus_exited():
	anim.pause()
	pass # Replace with function body.


func _on_button_mouse_entered():
	anim.play("default")
	pass # Replace with function body.


func _on_button_mouse_exited():
	anim.pause()
	pass # Replace with function body.


func _on_button_2_pressed():
	audio.set_stream(exit)
	audio.play()
	await get_tree().create_timer(0.4).timeout 
	get_tree().quit()
	pass # Replace with function body.


func _on_button_pressed():
	audio.set_stream(retry)
	audio.play()
	await get_tree().create_timer(0.4).timeout 
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_button_2_focus_entered():
	pass # Replace with function body.
