extends CharacterBody2D


@onready var fsm: Object = $FSM
@onready var wait: Node = $wait
@onready var reload: Node = $reload

@onready var dashing: bool = false
@onready var speed: float = 300.0
@onready var bullet_path: Object = preload("res://Scenes/bullet.tscn")
@onready var bullet: Node


const JUMP_VELOCITY: float = -500.0
const JUMP_MAX: float = -1800.0
const DASH_SPEED: float = 1200.0
const SHOOT_SPEED: float = 200.0

func _ready():
	pass

func _physics_process(delta):
	move_and_slide()
	
	pass


func shooting():
	var aiming: = Input.get_vector("left", "right", "up", "crounch")
	
	if reload.time_left == 0:
		bullet = bullet_path.instantiate()
		add_child(bullet)
		bullet.apply_central_impulse(aiming * bullet.speed)
		reload.start()
