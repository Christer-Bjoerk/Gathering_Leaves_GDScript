extends Control

var is_game_paused = false
var can_pause_game = false

signal game_mode
signal main_menu

func _ready():
	hide()

func _unhandled_input(event):
	
	# Pause the game when pressing the escape key
	if event.is_action_pressed("pause") && can_pause_game:
		is_game_paused =! is_game_paused
		visible = is_game_paused
		get_tree().paused = is_game_paused

func _on_pause_button_pressed():
	is_game_paused = false
	visible = is_game_paused
	get_tree().paused = is_game_paused


func _on_main_menu_button_pressed():
	main_menu.emit()
	is_game_paused = false
	get_tree().paused = is_game_paused

func _on_quit_game_button_pressed():
	get_tree().quit()
