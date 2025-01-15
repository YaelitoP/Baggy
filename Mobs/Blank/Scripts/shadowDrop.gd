extends baseState


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
	
func enter():
	print("drop")
	parent.anim.set_speed_scale(1.5)

func _physics_update(_delta):
	parent.anim.play("drop")
		
