extends baseState


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func enter():
	print("strike")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _physics_update(_delta):
	parent.anim.play("strike")
	
