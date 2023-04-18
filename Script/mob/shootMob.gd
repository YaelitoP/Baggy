extends baseState

@onready var mob: Object
@onready var targetPos: Vector2
@onready var targetDist: float
@onready var shootDist: float = 550
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_update(delta):
	mob.velocity.x = 0
	for i in mob.sight.get_overlapping_bodies():
		if i.name == "baggy":
			mob.shoot(i)
			targetPos = i.global_position
			if mob.global_position.distance_to(targetPos) > shootDist:
				exit(parent.SEEK)

