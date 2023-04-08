extends Node
class_name baseState

@onready var parent: Node = get_parent()
@onready var fsm : Object



func enter() -> void:
	print("estas en: ", self.name)

func exit(next_state) -> void:
	parent.change_to(next_state)
	

