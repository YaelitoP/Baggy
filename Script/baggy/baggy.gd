extends CharacterBody2D

@onready var fsm: Object = $FSM
@onready var body: Object = $coll_baggy
@onready var wait: Node = $wait
@onready var reload: Node = $reload
@onready var sprite: Node = $sprite_baggy
@onready var hurtBox: Node = $hurtBox
@onready var parry: Node = $parryBox
@onready var Iframes: Node = $Iframes
@onready var airTime: Node = $airTime

@onready var dashing: bool = false
@onready var jumping: bool = false
@onready var death: bool = false
@onready var speed: float = 500.0
@onready var life: int = 3
@onready var bullet_path: Object = preload("res://Scenes/bullet.tscn")

@onready var bullet: Node

signal hurted
signal pause
signal dead

var aiming: Vector2 = Vector2.RIGHT

var looking: Vector2


const JUMP_VELOCITY: float = -500.0
const JUMP_MAX: float = -1800.0
const DASH_SPEED: float = 900.0
const AIR_SPEED: float = 700.0
const SHOOT_SPEED: float = 200.0


func _ready():
	looking = aiming
	for node in get_tree().get_nodes_in_group("ui"):
		if node.has_method("update"):
			connect("hurted", node.update)
		if node.has_method("pause"):
			connect("pause", node.pause)
		if node.has_method("death"):
			connect("dead", node.death)



func _physics_process(_delta):
	move_and_slide()
	
	if Input.is_action_just_pressed("pausa"):
		get_tree().paused = true
		emit_signal("pause")
	
	if life == 0:
		death = true
	
	if death:
		emit_signal("dead")
		queue_free()
	
	if wait.time_left == 0:
		dashing = false



func dash():
	if wait.time_left != 0:
		dashing = true


func shooting():
	
	if reload.time_left == 0 and is_on_floor():
		bullet = bullet_path.instantiate()
		add_child(bullet)
		bullet.apply_central_impulse(aiming * bullet.speed)
		reload.start()
		
	


func invencible():
	if Iframes.time_left != 0:
		hurtBox.monitoring = false
		print("se")
		set_collision_layer_value(1, false)
	else:
		hurtBox.monitoring = true
		set_collision_layer_value(1, true)



func anim():
	
	var RIGHT: = Input.is_action_pressed("right")
	var LEFT: = Input.is_action_pressed("left")
	var UP: = Input.is_action_pressed("up")
	var _DOWN: = Input.is_action_pressed("crounch")
	var JUMP: = Input.is_action_pressed("jump")
	var DASH: = Input.is_action_pressed("dash")
	

	if is_on_floor() and !dashing:
		if (RIGHT or LEFT) and UP:
			aiming = Input.get_vector("left", "right", "up", "crounch") 
			
			if aiming.y <= -0.7 and aiming.x <= -0.7:
				sprite.play("shootLD")
				looking = Vector2.LEFT
			if aiming.y <= 0.7 and aiming.x >= 0.7:
				sprite.play("shootRD")
				looking = Vector2.RIGHT
		elif RIGHT or LEFT or UP:
			if LEFT:
				aiming = Vector2.LEFT
				looking = aiming
				parry.position.x = -35
				sprite.play("shootL")
			
			if RIGHT:
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
		else:
			sprite.play("idle")
		
	else:
		
		if JUMP:
			if looking == Vector2.LEFT:
				sprite.play("jumpL")
			
			if looking == Vector2.RIGHT:
				sprite.play("jumpR")
			
			
		elif !self.is_on_floor() and !dashing and airTime.time_left == 0:
			if looking == Vector2.LEFT:
				sprite.play("fallL")
			
			if looking == Vector2.RIGHT:
				sprite.play("fallR")
			
			
		
		if DASH and !self.is_on_floor():
			if looking == Vector2.LEFT:
				sprite.play("airDashL")
			
			if looking == Vector2.RIGHT:
				sprite.play("airDashR")
		
		elif DASH:
			if looking == Vector2.LEFT:
				sprite.play("dashL")
			
			if looking == Vector2.RIGHT:
				sprite.play("dashR")
		



func _on_iframes_timeout():
	hurtBox.monitoring = true
	pass # Replace with function body.
