extends baseState

@onready var target: Object
@onready var targetPos: Vector2
@onready var targetDist: float
@onready var shootDist: float = 260
@onready var next: Object
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
			
			if parent.velocity.x > 0 and parent.ray.is_colliding():
				parent.anim.play("moveRight")
				
			if parent.velocity.x < 0 and parent.ray.is_colliding():
				parent.anim.play("moveLeft")
				
			if parent.ray.is_colliding():
				parent.velocity.y = 0
				parent.velocity.x = targetPos.x * parent.SPEED/2
				if targetDist < shootDist:
					parent.velocity.x = 0
					fsm.chooseAtk()
					exit(fsm.next_state)
					
			elif targetDist > shootDist:
				parent.velocity.y = targetPos.y * parent.SPEED
				

func _on_sight_body_entered(_body):
	if fsm.state != fsm.DROP or fsm.state != fsm.ICE or fsm.state != fsm.STRIKE:
		exit(fsm.SEEK)
	pass
