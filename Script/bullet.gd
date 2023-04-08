extends RigidBody2D


const MAX_RANGE: float = 15000.0
@onready var speed: float = 1500.0
@onready var distance_traveled: float = 0.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _physics_process(delta):
	var distance = speed * delta
	distance_traveled += distance
	if distance_traveled > MAX_RANGE:
		queue_free()
