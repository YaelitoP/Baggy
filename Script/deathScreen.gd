extends Control

@onready var anim: Node = $VBoxContainer/HBoxContainer/Button/AnimatedSprite2D
@onready var button: Node = $VBoxContainer/HBoxContainer/Button

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if Input.is_action_just_pressed("left") and self.visible == true:
		button.grab_focus()
	pass

func death():
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
	get_tree().quit()
	pass # Replace with function body.


func _on_button_pressed():
	get_tree().reload_current_scene()
	pass # Replace with function body.


func _on_button_2_focus_entered():
	pass # Replace with function body.
