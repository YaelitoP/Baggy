extends CharacterBody2D


@onready var fsm: Object = $FSM
@onready var wait: Node = $wait

@onready var dashing: bool = false
@onready var speed: float = 300.0
@onready var bullet_path: Object = preload("res://Scenes/bullet.tscn")
@onready var bullet: Node
@onready var reload: float = 0.0

const JUMP_VELOCITY: float = -500.0
const JUMP_MAX: float = -1800.0
const DASH_SPEED: float = 1200.0
const SHOOT_SPEED: float = 200.0

func _ready():
	pass

func _physics_process(delta):
	move_and_slide()
	reload += reload * delta
	pass


func shooting():
	if reload <= SHOOT_SPEED:
		bullet = bullet_path.instantiate()
		add_child(bullet)
		bullet.add_constant_central_force(velocity.normalized() * bullet.speed)

