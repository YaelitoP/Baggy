extends CharacterBody2D


const SPEED = 200.0
const JUMP_VELOCITY = -400.0


var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

@onready var walkT: = $walking
@onready var wait: = $wait
@onready var reload: = $reload
@onready var sight: = $sight
@onready var bullet_path: Object = preload("res://Scenes/mob_bullet.tscn")
@onready var mobBullet: Node



func _physics_process(delta):
	move_and_slide()
	if !is_on_floor():
		velocity.y += gravity * delta
	
func shoot(target):
	var targetDir: = self.global_position.direction_to(target.global_position)
	if reload.time_left == 0:
		mobBullet = bullet_path.instantiate()
		add_child(mobBullet)
		mobBullet.apply_central_impulse(targetDir * mobBullet.speed)
		reload.start()

