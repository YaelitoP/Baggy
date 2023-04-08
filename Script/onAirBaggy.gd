extends baseState

@onready var baggy: Object
# Called when the node enters the scene tree for the first time.

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var jumpMaxed: bool = false
@onready var jumpTime: float = 0.0

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_update(delta):
	if !baggy.is_on_floor():
		baggy.velocity.y += gravity * delta
	else:
		exit(fsm.GROUNDED)
	
	if Input.is_action_pressed("shoot"):
		baggy.shooting()
		
	if Input.is_action_pressed("jump") and !jumpMaxed and jumpTime >= 0.4:
		baggy.velocity.y += lerp(baggy.velocity.y, baggy.JUMP_MAX, 0.2) * delta
		
	elif baggy.velocity.y <= baggy.JUMP_MAX or jumpTime >= 0.8:
		jumpMaxed = true
		
	if Input.is_action_pressed("jump"):
		jumpTime += jumpTime + 0.1
		
	var direction = Input.get_axis("left", "right")
	
	if Input.is_action_just_pressed("dash") and !baggy.dashing:
		baggy.wait.start()
		dash()
	elif baggy.dashing and baggy.wait.time_left != 0:
		baggy.velocity.x = direction * baggy.DASH_SPEED/2
	else:
		dash()
	
func dash():
	if baggy.wait.time_left != 0:
		baggy.dashing = true
	if baggy.wait.time_left == 0:
		baggy.dashing = false


func exit(next_state) -> void:
	jumpMaxed = false
	jumpTime = 0
	parent.change_to(next_state)
	
