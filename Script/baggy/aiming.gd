extends baseState

@onready var baggy = Object


func _ready():
	pass # Replace with function body.

func _physics_update(delta):
	baggy.side_facing()
