extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0
@onready var walkT: = $walking
@onready var wait: = $wait

# Get the gravity from the project settings to be synced with RigidBody nodes.



func _physics_process(delta):
	move_and_slide()

