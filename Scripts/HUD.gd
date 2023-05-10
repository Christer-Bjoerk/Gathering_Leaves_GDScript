extends CanvasLayer

var playerHealth = 3

signal start_game
signal update_player_sprite

# Audio Settings
@onready var master_volume_slider = $SettingsMenu/SettingsTabContainer/Setting/MarginContainer/GridContainer/HBoxContainer/MasterVolumeSlider

func _ready():
	in_game_hud(false)
	master_volume_slider.value = Save.game_data.master_volume

func update_score(score):
	$ScoreLabel.text = str(score)
	
func _on_play_button_pressed():
	$StartMenu.hide()
	start_game.emit()
	
func show_message(text):
	$Message.text = text
	$Message.show()
	$MessageTimer.start()

func _on_message_timer_timeout():
	$Message.hide()

func in_game_hud(active):
	if active:
		$ScoreLabel.show()
		$Message.show()
	elif !active:
		$ScoreLabel.hide()
		$Message.hide()

func show_game_over():
	show_message("Game Over")
	await $MessageTimer.timeout
	$StartMenu.show()

func _on_credits_button_pressed():
	$StartMenu.hide()
	$Credits.show()

func _on_return_button_pressed():
	$Credits.hide()
	$StartMenu.show()

func _on_master_volume_slider_value_changed(value):
	GlobalSettings.update_master_volume(value)


func _on_return_button_settings_pressed():
	$SettingsMenu.hide()
	$StartMenu.show()
	
func _on_settings_button_pressed():
	$StartMenu.hide()
	$SettingsMenu.show()
