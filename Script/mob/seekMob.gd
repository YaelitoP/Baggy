extends baseState

@onready var mob: Object
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process_update(delta):
	pass


func _on_sight_body_entered(body):
	exit(fsm.SEEK)
	pass # Replace with function body.
