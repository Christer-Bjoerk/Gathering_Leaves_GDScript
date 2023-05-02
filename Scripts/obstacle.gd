extends RigidBody2D

signal damage_player

func _on_visible_on_screen_notifier_2d_screen_exited():
	damage_player.emit()
	queue_free()
