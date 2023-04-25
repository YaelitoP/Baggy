extends baseState

@onready var baggy: Object
# Called when the node enters the scene tree for the first time.

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
@onready var dobleJump: int = 1
@onready var jumpMaxed: bool = false
@onready var jumpTime: float = 0.0

func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_update(delta):
	baggy.side_facing()
	if !baggy.is_on_floor():
		baggy.velocity.y += gravity * delta
	else:
		dobleJump = 1
		exit(fsm.GROUNDED)
	
	if Input.is_action_pressed("shoot"):
		baggy.shooting()
		
	if Input.is_action_pressed("jump") and !jumpMaxed and jumpTime >= 0.4:
		baggy.velocity.y += lerp(baggy.velocity.y, baggy.JUMP_MAX, 0.2) * delta
		
	elif baggy.velocity.y <= baggy.JUMP_MAX or jumpTime >= 0.8:
		jumpMaxed = true
		
	if Input.is_action_pressed("jump"):
		jumpTime += jumpTime + 0.1
		
	if Input.is_action_just_pressed("jump") and dobleJump != 0:
		baggy.velocity.y += baggy.JUMP_VELOCITY
		jumpTime = 0
		dobleJump = dobleJump - 1
	
	var direction = Input.get_axis("left", "right")
	
	if Input.is_action_just_pressed("dash") and !baggy.dashing:
		baggy.wait.start()
		baggy.dash()
	elif baggy.dashing and baggy.wait.time_left != 0:
		baggy.velocity.x = direction * baggy.DASH_SPEED/2
	else:
		baggy.dash()
	

func exit(next_state) -> void:
	jumpMaxed = false
	jumpTime = 0
	parent.change_to(next_state)
	
