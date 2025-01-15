extends baseState


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func enter():
	parent.anim.set_speed_scale(2)
	print("strike")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_update(_delta):
	parent.anim.play("strike")
	parent.velocity.x = parent.velocity.x * parent.SPEED/2
