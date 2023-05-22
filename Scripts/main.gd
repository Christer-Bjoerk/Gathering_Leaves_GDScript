extends Node

@export var obstacle_scene: PackedScene

var score = 0

func new_game():
	$HUD.in_game_hud(true)
	$HUD.show_message("Get Ready")
	$ObstacleTimer.start()
	$Player.player_health = 3

func _on_obstacle_timer_timeout():
	
	# New instance of the Obstacle scene
	var obstacle = obstacle_scene.instantiate()
	
	# Get a random location on the path2D
	var obstacle_spawn_location = get_node("ObstaclePath/ObstacleSpawnLocation")
	obstacle_spawn_location.progress_ratio = randf()
	
	# Set the obstacle to a random position
	obstacle.position = obstacle_spawn_location.position
	
	# Spawn obstacles
	add_child(obstacle)
	
	obstacle.damage_player.connect($Player.update_player_health.bind())

func _on_hud_start_game():
	new_game()
	$PauseMenu.can_pause_game = true
	$Player.modulate.a8 = 255

func _on_player_game_over():
	# Stop the game
	$ObstacleTimer.stop()
	$HUD.show_game_over()
	$PauseMenu.can_pause_game = false
	
	# Delete the remaining obstacles
	# to prevent Game Over message from displaying more than once
	destroy_objects("garbage", "queue_free")

func _on_pause_menu_main_menu():
	$ObstacleTimer.stop()
	$PauseMenu.can_pause_game = false
	$PauseMenu.hide()
	$HUD/StartMenu.show()
	
	# Delete the remaining obstacles
	# to prevent Game Over message from displaying more than once
	destroy_objects("garbage", "queue_free")

func destroy_objects(group:String,function:String):
	get_tree().call_group(group,function)


func _on_player_update_health():
	# Updating total score
	score += 1
	$HUD.update_score(score)
