extends baseState

@onready var baggy: Object


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	pass

func _physics_update(delta):
	baggy.side_facing()
	if not baggy.is_on_floor():
		baggy.velocity.y += gravity * delta
	if Input.is_action_pressed("left") or Input.is_action_pressed("right"):
		exit(fsm.GROUNDED)
	if Input.is_action_just_pressed("jump"):
		exit(fsm.ONAIR)
		
	if Input.is_action_just_pressed("parry"):
		exit(fsm.PARRY)
