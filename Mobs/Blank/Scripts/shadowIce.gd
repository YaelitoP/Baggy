extends baseState


@onready var target: Object
@onready var targetPos: Vector2
@onready var targetDist: float
@onready var shootDist: float = 260
@onready var next: Object
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func enter():
	parent.anim.set_speed_scale(2)
	print("ice")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	pass

func _physics_update(_delta):
			
	if !parent.anim.get_current_animation() == "ice":
		parent.anim.play("dropIce")
		
	parent.anim.queue("ice")
