extends CharacterBody2D


@onready var fsm: Object = $FSM
@onready var wait: Node = $wait
@onready var reload: Node = $reload

@onready var dashing: bool = false
@onready var speed: float = 300.0
@onready var bullet_path: Object = preload("res://Scenes/bullet.tscn")
@onready var bullet: Node

var aiming: Vector2 = Vector2.RIGHT
var looking: Vector2

const JUMP_VELOCITY: float = -500.0
const JUMP_MAX: float = -1800.0
const DASH_SPEED: float = 1200.0
const SHOOT_SPEED: float = 200.0

func _ready():
	looking = aiming
	pass

func _physics_process(delta):
	move_and_slide()
	side_facing()
	pass


func dash():
	if wait.time_left != 0:
		dashing = true
	if wait.timeout:
		dashing = false

func shooting():
	
	if reload.time_left == 0:
		bullet = bullet_path.instantiate()
		add_child(bullet)
		bullet.apply_central_impulse(aiming * bullet.speed)
		reload.start()

func side_facing():
	
	if Input.is_action_just_pressed("left"):
		aiming = Vector2.LEFT
		looking = aiming
		
	if Input.is_action_just_pressed("right"):
		aiming = Vector2.RIGHT
		looking = aiming
		
	if Input.is_action_pressed("up"):
		aiming = Vector2.UP
	elif Input.is_action_just_released("up"):
		aiming = looking
	if Input.is_action_pressed("crounch"):
		aiming = Vector2.DOWN
	elif Input.is_action_just_released("crounch"):
		aiming = looking
		
	if Input.is_action_pressed("right") and (Input.is_action_pressed("up") or Input.is_action_pressed("crounch")):
		aiming = Input.get_vector("left", "right", "up", "crounch") 
		
	if Input.is_action_pressed("left") and (Input.is_action_pressed("up") or Input.is_action_pressed("crounch")):
		aiming = Input.get_vector("left", "right", "up", "crounch")
