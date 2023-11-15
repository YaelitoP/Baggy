extends baseState


@onready var target: Object
@onready var targetPos: Vector2
@onready var targetDist: float
@onready var shootDist: float = 260
@onready var next: Object

func enter():
	pass

func _physics_update(_delta):
	for i in parent.sight.get_overlapping_bodies():
		if i.name == "baggy":
			parent.anim.play("shooted")
			target = i
			targetDist = parent.global_position.distance_to(i.global_position) * 1.5
			targetPos = parent.global_position.direction_to(Vector2(i.global_position.x, i.global_position.y * 1.5))
			parent.velocity = (targetPos * parent.SHOT_SPEED)
			if targetDist > 5:
				print("close ", targetDist)
				exit(fsm.SEEK)
				
