extends StateMachine

@onready var IDLE: = $idle
@onready var SEEK: = $seek
@onready var SHOOT: = $shoot

enum STATES {
	IDLE,
	SEEK,
	SHOOT,
}

func _ready():
	state = IDLE
	for child in get_children():
		child.mob = self.parent
	call_deferred("_enter_state")



func _physics_process(delta: float) -> void:
	if state.has_method("_process_update"):
		state._process_update(delta)
