extends StateMachine

@onready var IDLE: Node = $idle
@onready var GROUNDED: Node = $grounded
@onready var ONAIR: Node = $onAir
@onready var HURT: Node = $hurt

var direction = Vector2.ZERO

enum STATES {
		IDLE,
		GROUNDED,
		ONAIR,
		HURT,
	}
	
func _ready() -> void:
	# Set the initial state to the first child node
	state = GROUNDED
	
	for child in get_children():
		child.fsm = self
		child.baggy = parent
	call_deferred("_enter_state")

# Route Game Loop function calls to
# current state handler method if it exists
func _process(delta: float) -> void:
	if state.has_method("process"):
		state.process(delta)

func _physics_process(delta: float) -> void:
	if state.has_method("_physics_update"):
		state._physics_update(delta)

func get_random_state():
	var state_count = []
	state_count.shuffle()
	var random_index = randi() % state_count.size()
	var state_list = STATES.values()
	var random_state = state_list[random_index]
	var next_state = state
	
	if random_state == 0:
		next_state = IDLE
	elif random_state == 1:
		next_state = GROUNDED
	elif random_state == 2:
		next_state = ONAIR
	
	return next_state
