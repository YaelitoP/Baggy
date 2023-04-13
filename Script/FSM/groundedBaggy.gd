extends baseState

@onready var baggy: Object


@onready var jumpMaxed: bool = false
@onready var jumpTime: float = 0.0


# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _physics_update(delta: float) -> void:
	if !baggy.is_on_floor():
		baggy.velocity.y += gravity * delta
	
	# Handle Jump.
	if Input.is_action_just_pressed("jump") and baggy.is_on_floor():
		baggy.velocity.y += baggy.JUMP_VELOCITY
		exit(fsm.ONAIR)
	var direction = Input.get_axis("left", "right")
	movement(direction)
	
	if Input.is_action_pressed("shoot"):
		baggy.shooting()
	
		


func movement(direction):
	
# Get the input direction and handle the movement/deceleration. 
	# As good practice, you should replace UI actions with custom gameplay actions.
	
	if direction and !baggy.dashing:
		baggy.velocity.x = direction * baggy.speed
		
		if Input.is_action_just_pressed("dash"):
			baggy.wait.start()
			baggy.dash()
	elif baggy.dashing and baggy.wait.time_left != 0:
		baggy.velocity.x = direction * baggy.DASH_SPEED
	else:
		baggy.dash()
		baggy.velocity.x = move_toward(baggy.velocity.x, 0, baggy.speed)
	




