extends RigidBody2D
class_name baseBullet

const MAX_RANGE: float = 12000.0
@onready var speed: float = 5000.0
@onready var distance_traveled: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var distance = speed * delta
	distance_traveled += distance
	if distance_traveled > MAX_RANGE:
		queue_free()
	


func _on_area_2d_body_entered(_body):
	queue_free()
	pass # Replace with function body.
