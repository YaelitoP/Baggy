extends baseState

@onready var baggy: Object
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func enter():
	baggy.Iframes.start()
	baggy.emit_signal("hurted")
	print("auch")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_update(_delta):
	baggy.velocity = Vector2.ZERO
	baggy.invencible()
	if baggy.Iframes.timeout:
		baggy.set_collision_layer_value(1, true)
		exit(fsm.history.back())


func _on_hurt_box_body_entered(_body):
	baggy.set_collision_layer_value(1, false)
	baggy.life = baggy.life - 1
	exit(fsm.HURT)
	pass # Replace with function body.

