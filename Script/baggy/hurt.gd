extends baseState

@onready var baggy: Object
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func enter():
	baggy.Iframes.start()
	print("auch")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_update(delta):
	baggy.velocity = Vector2.ZERO
	baggy.invencible()
	if baggy.Iframes.timeout:
	#	baggy.body.set_deferred("disabled", true)
		exit(fsm.history.back())


func _on_hurt_box_body_entered(body):
#	baggy.body.set_deferred("disabled", true)
	exit(fsm.HURT)
	pass # Replace with function body.

