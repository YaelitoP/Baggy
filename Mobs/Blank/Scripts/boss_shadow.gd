extends CharacterBody2D

@onready var sight: Object = $sight
@onready var sprite: Object = $sprite_shadow
@onready var anim: Object = $AnimationPlayer
@onready var ray: Object = $floorRay
@onready var aimed: Object = $atkRay
@onready var fsm: Object = $fsm
@onready var hitbox: Node = $coll_shadow
@onready var aimRay = $aimRay
@onready var atkTime = $atkTime
@onready var audio = $AudioStreamPlayer2D

@onready var strike: = preload("res://SFX/strike.mp3")
@onready var ice: = preload("res://SFX/Ice.wav")
@onready var drop: = preload("res://SFX/drop.wav")

signal respawn

const SPEED = 850.0
const SHOT_SPEED = 800
const JUMP_VELOCITY = -400.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func ready():
	randomize()
	
func _physics_process(_delta):
	
	move_and_slide()
	
func throw():
	fsm.call_deferred("change_to", fsm.SHOOT)
	



