extends Node

@export var obstacle_scene: PackedScene

var score = 0

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
	
	obstacle.damage_player.connect($HUD.update_player_health.bind())

func _on_player_update_score():
	# Updating total score
	score += 1
	$HUD.update_score(score)
