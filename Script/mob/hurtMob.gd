extends baseState

@onready var mob: Object
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_update(_delta):
	mob.Iframes()
	mob.velocity.x = 0
	mob.sprite.play("hurt")
	
	


func _on_hurt_body_entered(_body):
	if parent.state != parent.STUN:
		exit(parent.HURT)
	


func _on_wait_timeout():
	if parent.state != parent.STUN:
		mob.sprite.play("default")
		exit(parent.IDLE)
		
