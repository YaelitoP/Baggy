extends StateMachine


@onready var IDLE: = $idle
@onready var SEEK: = $seek
@onready var DROP: = $drop
@onready var STRIKE: = $strike
@onready var ICE: = $ice

enum STATES {
	IDLE,
	SEEK,
	DROP,
	STRIKE,
	ICE,
}

func _ready():
	state = IDLE
	for child in get_children():
		child.parent = self.parent
		child.fsm = self
	call_deferred("_enter_state")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
