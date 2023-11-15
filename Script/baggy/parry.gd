extends baseState

@onready var baggy: Object

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
# Called when the node enters the scene tree for the first time.

func _ready():
	pass # Replace with function body.

func enter():
	baggy.parry.set_modulate(Color.CRIMSON)
	baggy.parry.monitoring = true
	baggy.parry.monitorable = true
	
func exit(next_state):
	baggy.parry.set_modulate(Color.WHITE)
	baggy.parry.monitoring = false
	baggy.parry.monitorable = false
	parent.change_to(next_state)

func _physics_update(delta):
	
	if baggy.Iframes.time_left == 0:
		baggy.Iframes.start()
	
	baggy.velocity.x = move_toward(baggy.velocity.x, 0, baggy.speed)
	
	if !baggy.is_on_floor():
		baggy.velocity.y += gravity * delta
	
	
	

func _on_parry_box_body_entered(_body):
	print("parriado pa")
	baggy.invencible()
	baggy.parry.set_deferred("monitoring", false)


func _on_iframes_timeout():
	baggy.invencible()
	baggy.parry.monitoring = false
	exit(fsm.IDLE)
	
