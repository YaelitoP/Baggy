extends CharacterBody2D

@onready var fsm: Object = $FSM
@onready var wait: Node = $wait
@onready var reload: Node = $reload
@onready var sprite: Node = $sprite_baggy
@onready var hurtBox: Node = $hurtBox
@onready var parry: Node = $parryBox

@onready var dashing: bool = false
@onready var speed: float = 500.0

@onready var bullet_path: Object = preload("res://Scenes/bullet.tscn")
@onready var bullet: Node
@onready var Iframes: Node = $Iframes
var aiming: Vector2 = Vector2.RIGHT
var looking: Vector2


const JUMP_VELOCITY: float = -500.0
const JUMP_MAX: float = -1800.0
const DASH_SPEED: float = 1400.0
const SHOOT_SPEED: float = 200.0


func _ready():
	looking = aiming
	

func _physics_process(_delta):
	move_and_slide()
	if wait.time_left == 0:
		dashing = false



func dash():
	if wait.time_left != 0:
		dashing = true


func shooting():
	
	if reload.time_left == 0:
		bullet = bullet_path.instantiate()
		add_child(bullet)
		bullet.apply_central_impulse(aiming * bullet.speed)
		reload.start()
		
	


func invencible():
	if Iframes.time_left == 0:
		Iframes.start()
		hurtBox.monitoring = false
	



func side_facing():
	
	var RIGHT: = Input.is_action_pressed("right")
	var LEFT: = Input.is_action_pressed("left")
	var UP: = Input.is_action_pressed("up")
	var DOWN: = Input.is_action_pressed("crounch")
	
	if (RIGHT or LEFT) and (UP or DOWN):
		aiming = Input.get_vector("left", "right", "up", "crounch") 
		
		if aiming >= Vector2(-1, -1) and aiming < Vector2(-0.50, -0.50):
			sprite.play("shootLD")
			looking = Vector2.LEFT
		if aiming <= Vector2(1, -1) and aiming > Vector2(0.50, -0.50):
			sprite.play("shootRD")
			looking = Vector2.RIGHT
	else:
		if Input.is_action_pressed("left"):
			aiming = Vector2.LEFT
			looking = aiming
			parry.position.x = -35
			sprite.play("shootL")
		
		
		if Input.is_action_pressed("right"):
			aiming = Vector2.RIGHT
			looking = aiming
			parry.position.x = 120
			sprite.play("shootR")
		
		
		if UP:
			aiming = Vector2.UP
			
			if looking == Vector2.LEFT:
				sprite.play("shootLU")
				
			if looking == Vector2.RIGHT:
				sprite.play("shootRU")
			
			
		elif Input.is_action_just_released("up"):
			aiming = looking
			
			if looking == Vector2.LEFT:
				sprite.play("shootL")
				
			if looking == Vector2.RIGHT:
				sprite.play("shootR")
			
		if DOWN:
			aiming = Vector2.DOWN
			
		elif Input.is_action_just_released("crounch"):
			aiming = looking
			
			if looking == Vector2.LEFT:
				sprite.play("shootL")
				
			if looking == Vector2.RIGHT:
				sprite.play("shootR")
			


func _on_iframes_timeout():
	hurtBox.monitoring = true
	pass # Replace with function body.
