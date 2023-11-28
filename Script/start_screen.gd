extends Control


@onready var container = $Container
@onready var primero = $Container/primero
@onready var segundo = $Container/segundo
@onready var tercero = $Container/tercero
@onready var label = $Label


var fullText: int = 200  
var text_speed = 0.05 # Tiempo en segundos entre letras
var time_since_last_char = 0.0
var char_index = 0 # Nuevo índice para controlar la adición de caracteres

func _ready():
	visible = true
	get_tree().set_pause(true)
	pass

func _process(delta):
	if !barbudo.start:
		time_since_last_char += delta
		if time_since_last_char >= text_speed and label.get_visible_characters() < fullText:
			char_index += 1
			label.set_visible_characters(char_index)
			time_since_last_char = 0
	else:
		queue_free()
	pass


func _on_video_stream_player_finished():
	segundo.play()
	pass 

func _on_segundo_finished():
	await get_tree().create_timer(1).timeout
	tercero.play()
	pass

func _on_tercero_finished():
	get_tree().set_pause(false)
	queue_free()
	pass 
