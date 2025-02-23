extends baseState


@onready var target: Object
@onready var targetPos: Vector2
@onready var _targetDist: float
@onready var shootDist: float = 260
@onready var next: Object

func enter():
	pass

func _physics_update(_delta):
	for i in parent.sight.get_overlapping_bodies():
		if i.name == "baggy":
			parent.anim.play("shooted")
			target = i
			targetPos = parent.global_position.direction_to(Vector2(i.global_position.x, i.global_position.y))
			parent.velocity = (targetPos * parent.SHOT_SPEED) * 2
	if parent.aimRay.is_colliding():
		parent.anim.play("idle")
		exit(fsm.SEEK)
		pass
