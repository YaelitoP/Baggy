extends baseState

@onready var target: Object
@onready var targetPos: Vector2
@onready var targetDist: float
@onready var shootDist: float = 260
@onready var next: Object
@onready var cd: bool = false
# Called when the node enters the scene tree for the first time.

func _ready():
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_update(_delta):
	for i in parent.sight.get_overlapping_bodies():
		if i.name == "baggy":
			target = i
			targetPos = parent.global_position.direction_to(i.global_position)
			targetDist = parent.global_position.distance_to(i.global_position)
			parent.velocity.x = targetPos.x * parent.SPEED
			
			if parent.velocity.x > 0 and parent.ray.is_colliding() and parent.atkTime.timeout:
				parent.velocity.x = targetPos.x * parent.SPEED * 2
				parent.anim.play("moveRight")
				
			if parent.velocity.x < 0 and parent.ray.is_colliding() and parent.atkTime.timeout:
				parent.velocity.x = targetPos.x * parent.SPEED * 2
				parent.anim.play("moveLeft")
				
			if parent.ray.is_colliding():
				parent.velocity.y = 0
				parent.velocity.x = targetPos.x * parent.SPEED
			
	if parent.aimed.is_colliding() and parent.atkTime.time_left == 0:
		parent.atkTime.start()
	
func _on_sight_body_entered(_body):
	if fsm.state != fsm.DROP and fsm.state != fsm.ICE and fsm.state != fsm.STRIKE and fsm.state != fsm.SHOOT:
		exit(fsm.SEEK)
	pass


func _on_atk_time_timeout():
	if targetDist < shootDist:
		parent.velocity.x = 0
		fsm.chooseAtk()
		exit(fsm.next_state)
	elif targetDist > shootDist:
		parent.velocity.y = targetPos.y * parent.SPEED
	pass # Replace with function body.
