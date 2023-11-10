extends StaticBody2D

@onready var shadow: = preload("res://Mobs/Blank/boss_shadow.tscn")
@onready var shdInstance: Object 
@onready var anim: Node = $AnimatedSprite2D
@onready var area: Node = $Area2D
@onready var shdSpawn: Node = $shdSpawn
@onready var cd: Node = $cd
@onready var look_at: Vector2
@onready var spawn: = false

signal throwShd
# Called when the node enters the scene tree for the first time.
func _ready():
	cd.start()

func _physics_process(delta):
	
	turnHead()
	
	for body in area.get_overlapping_bodies():
		if body.name == "baggy":
			look_at = body.get_global_position()

	if !is_instance_valid(shdInstance) and cd.time_left == 0:
		spawn = true
		shdInstance = shadow.instantiate()
		await get_tree().create_timer(0.5).timeout
		shdInstance.respawn.connect(respawn_shadow)
		self.throwShd.connect(shdInstance.throw)
		shdSpawn.add_child(shdInstance)
		shdInstance.global_position = shdSpawn.global_position
		emit_signal("throwShd")
	


func respawn_shadow():
	cd.start()

func turnHead():
	if !spawn and !anim.is_playing():
		if look_at.x > self.global_position.x + 200 and anim.animation != "turnRight":
			anim.play("turnRight")
		if look_at.x < self.global_position.x - 200 and anim.animation != "turnLeft":
			anim.play("turnLeft")
			
		if look_at.x > self.global_position.x - 190 and look_at.x < self.global_position.x + 190:
			if anim.get_animation() == "turnLeft":
				anim.play("turnMidL")
			if anim.get_animation() == "turnRight":
				anim.play("turnMidR")
			
	elif spawn:
		
		if anim.get_animation() == "turnLeft":
			anim.play("screemL")
			spawn = false
		
		elif anim.get_animation() == "turnRight":
			anim.play("screemR")
			spawn = false
		
		elif anim.get_animation() == "turnMidR" or anim.get_animation() == "turnMidL" or anim.get_animation() == "screem":
			anim.play("screem")
			spawn = false
		else:
			spawn = false


func _on_area_2d_body_exited(body):
	if body == shdInstance:
		shdInstance.queue_free()
		print("yeah")
	pass # Replace with function body.
