extends baseState


@onready var target: Object
@onready var targetPos: Vector2
@onready var targetDist: float
@onready var shootDist: float = 260
@onready var next: Object

func enter():
	pass

func _physics_update(delta):
	for i in parent.sight.get_overlapping_bodies():
		if i.name == "baggy":
			parent.anim.play("shooted")
			target = i
			targetPos = parent.global_position.direction_to(i.global_position)
			targetDist = parent.global_position.distance_to(i.global_position) * 0.5
			parent.velocity = (targetPos * parent.SPEED) * 1.3
			
