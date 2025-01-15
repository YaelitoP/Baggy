extends Control

@onready var count: int = 0
@onready var life: Node = $HBoxContainer/Vida
@onready var life2: Node = $HBoxContainer/Vida2
@onready var life3: Node = $HBoxContainer/Vida3
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(_delta):
	pass

func update():
	if count == 0:
		count = 1
		life3.visible = false
		
	elif count == 1:
		count = 2
		life2.visible = false
		
	elif count == 2:
		life.visible = false
