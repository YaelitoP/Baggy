extends StateMachine

@onready var IDLE: = $idle
@onready var SEEK: = $seek
@onready var SHOOT: = $shoot
@onready var HURT: = $hurt
@onready var STUN: = $stun
enum STATES {
	IDLE,
	SEEK,
	SHOOT,
	HURT,
	STUN,
}

func _ready():
	state = IDLE
	for child in get_children():
		child.mob = self.parent
		child.fsm = self
	call_deferred("_enter_state")



func _physics_process(delta: float) -> void:
	if state.has_method("_physics_update"):
		state._physics_update(delta)

func change_to(new_state) -> void:
	history.append(state)
	state = new_state
	_enter_state()
