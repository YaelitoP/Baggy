extends CharacterBody2D

@onready var shadow: = preload("res://Mobs/Blank/boss_shadow.tscn")
@onready var shdInstance: Object 
@onready var anim: Node = $AnimatedSprite2D
@onready var area: Node = $Area2D
@onready var shdSpawn: Node = $shdSpawn
@onready var cd: Node = $cd
@onready var look_at: Vector2
@onready var spawn: bool = false
@onready var death: bool = false
@onready var hits: int = 15
@onready var animation: Node = $AnimationPlayer
@onready var audio = $AudioStreamPlayer2D

@onready var hit: = preload("res://SFX/hit.wav")
@onready var screem: = preload("res://SFX/Screem.wav")

signal win
signal throwShd


func _ready():
	cd.start()

func _physics_process(_delta):
	
	turnHead()
	for node in get_tree().get_nodes_in_group("end"):
		if node.has_method("ending"):
			if !is_connected("win", node.ending):
				connect("win", node.ending)
	for body in area.get_overlapping_bodies():
		if body.name == "baggy":
			look_at = body.get_global_position()
		
	if !death:
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
	if !spawn and !anim.is_playing() and !death:
		if look_at.x > self.global_position.x + 250 and anim.animation != "turnRight":
			anim.play("turnRight")
		if look_at.x < self.global_position.x - 250 and anim.animation != "turnLeft":
			anim.play("turnLeft")
			
		if look_at.x > self.global_position.x - 200 and look_at.x < self.global_position.x + 190:
			if anim.get_animation() == "turnLeft":
				anim.play("turnMidL")
			if anim.get_animation() == "turnRight":
				anim.play("turnMidR")
			
	elif spawn and !death:
		
		if anim.get_animation() == "turnLeft":
			anim.play("screemL")
			audio.set_stream(screem)
			audio.play()
			spawn = false
		
		elif anim.get_animation() == "turnRight":
			anim.play("screemR")
			audio.set_stream(screem)
			audio.play()
			spawn = false
		
		elif anim.get_animation() == "turnMidR" or anim.get_animation() == "turnMidL" or anim.get_animation() == "screem":
			audio.set_stream(screem)
			audio.play()
			anim.play("screem")
			spawn = false
		else:
			spawn = false


func _on_area_2d_body_exited(body):
	if body == shdInstance:
		shdInstance.queue_free()



func _on_hurt_area_body_entered(body):
	if hits != 0:
		audio.set_stream(hit)
		audio.play()
		if anim.get_animation() == "turnLeft":
			anim.play("hurtL")
		
		elif anim.get_animation() == "turnRight":
			anim.play("hurtR")
			
		elif !anim.get_animation() == "hurtL" or !anim.get_animation() == "hurtR":
			anim.play("hurt")
		
		hits = hits - 1
	elif hits == 0:
		animation.play("muerte")
		death = true



func _on_animation_player_animation_finished(anim_name):
	emit_signal("win")
	pass # Replace with function body.
