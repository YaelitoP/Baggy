extends baseState


@onready var mob: Object
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func _process(delta):
	if mob.stun == true:
		exit(parent.STUN)
# Called every frame. 'delta' is the elapsed time since the previous frame.

func _physics_update(_delta):
	mob.wait.set_wait_time(1.0)
	mob.wait.start()
	mob.velocity.x = 0
	mob.sprite.play("hurt")
	
	


func _on_wait_timeout():
	mob.stun = false
	mob.wait.set_wait_time(0.6)
	exit(parent.IDLE)

	mob.sprite.play("default")

	
