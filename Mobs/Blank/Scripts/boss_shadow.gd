extends CharacterBody2D

@onready var sight: Object = $sight
@onready var sprite: Object = $sprite_shadow
@onready var anim: Object = $AnimationPlayer
@onready var ray: Object = $floorRay
@onready var aimed: Object = $atkRay
@onready var fsm: Object = $fsm
@onready var hitbox: Node = $coll_shadow
signal respawn

const SPEED = 850.0
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func ready():
	randomize()
	
func _physics_process(delta):
	move_and_slide()
	
func throw():
	print("enter")
	fsm.call_deferred("change_to", fsm.SHOOT)
	


func _on_detect_collide_body_entered(body):
	hitbox.set_deferred("disabled", true)

