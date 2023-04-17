extends baseState

@onready var mob: Object

var dire: int = 0
var direction: int = 0
var distance: float = 0.0

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")
# Called when the node enters the scene tree for the first time.

func _ready():
	randomize()
	
	dire = randi() % 2
	distance = randf_range(20, 50)
	
	
func _process_update(delta):
	if !mob.is_on_floor():
		mob.velocity.y += gravity * delta
		
	if dire > 0:
		direction = 1
	if dire == 0:
		direction = -1
	
	if mob.walkT.time_left != 0 and mob.global_position.distance_to(Vector2(dire * distance, 0)) > distance / distance + 1:
		mob.velocity.x = direction * mob.SPEED
		
	else:
		mob.velocity.x = move_toward(mob.velocity.x, 0, mob.SPEED)
		mob.walkT.start()


func _on_walking_timeout():
	distance = randf_range(20, 50)
	dire = randi() % 2
