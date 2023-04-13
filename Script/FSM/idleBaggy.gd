extends baseState

@onready var baggy: Object


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	pass

func _physics_update(delta):
	if not baggy.is_on_floor():
		baggy.velocity.y += gravity * delta
		
	pass
