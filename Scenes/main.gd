extends Node

@export var obstacle_scene: PackedScene

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
