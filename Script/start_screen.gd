extends Control


@onready var primero = $Panel/Container/primero
@onready var segundo = $Panel/Container/segundo
@onready var tercero = $Panel/Container/tercero
@onready var label = $Panel/Label




var full_text = "esto tiene que ser un texto que dure todo lo que dura el total de los tres videos de alguna manera necesitaria saberlo
sigue hacia abajo o se rompe"
var displayed_text = ""
var text_speed = 0.05 # Tiempo en segundos entre letras
var time_since_last_char = 0.0

 
func _ready():
	label.text = ""
	
func _process(delta):
	time_since_last_char += delta
	if time_since_last_char >= text_speed and len(displayed_text) < len(full_text):
		var next_char = full_text[len(displayed_text)]
		displayed_text += next_char
		label.text = displayed_text
		time_since_last_char = 0
	pass


func _on_video_stream_player_finished():
	segundo.play()
	pass # Replace with function body.


func _on_segundo_finished():
	tercero.play()
	pass # Replace with function body.
