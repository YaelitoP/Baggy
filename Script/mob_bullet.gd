extends baseBullet

@onready var parent: Node

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _on_area_2d_body_entered(body):
	
	queue_free()


func _on_area_2d_area_entered(area):
	if area.name == "parryBox":
		pass
	queue_free()
	pass # Replace with function body.
