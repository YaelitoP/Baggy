extends CharacterBody2D

@onready var sight: Object = $sight
@onready var sprite: Object = $sprite_shadow
@onready var anim: Object = $AnimationPlayer
@onready var ray: Object = $RayCast2D
const SPEED = 450.0
const JUMP_VELOCITY = -400.0
# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func ready():
	randomize()
	
func _physics_process(delta):
	move_and_slide()
	
