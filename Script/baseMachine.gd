extends Node

class_name StateMachine


@onready var parent = get_parent()
@onready var state: Object

const DEBUG = true

var history = []

func _ready() -> void:
	# Set the initial state to the first child node
	pass

func change_to(new_state) -> void:
	history.append(state)
	state = new_state
	_enter_state()

func back() -> void:
	if history.size() > 0:
		state = history.pop_back()
		_enter_state()

func _enter_state() -> void:
	# Give the new state a reference to this state machine script
	state.enter()
	

# Route Game Loop function calls to
# current state handler method if it exists
func _process(delta: float) -> void:
	if state.has_method("process"):
		state.process(delta)

func _physics_process(delta: float) -> void:
	if state.has_method("_physics_update"):
		state._physics_update(delta)


