extends baseState

@onready var mob: Object
@onready var target: Object
@onready var targetPos: Vector2
@onready var targetDist: float
@onready var shootDist: float = 500
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_update(_delta):
	for i in mob.sight.get_overlapping_bodies():
		if i.name == "baggy":
			target = i
			targetPos = mob.global_position.direction_to(i.global_position)
			targetDist = mob.global_position.distance_to(i.global_position)
			mob.velocity.x = targetPos.x * mob.SPEED
			
			if targetDist < shootDist:
				exit(parent.SHOOT)

func _on_sight_body_entered(_body):
	exit(parent.SEEK)
	pass # Replace with function body.
