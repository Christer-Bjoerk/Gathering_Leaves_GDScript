extends CanvasLayer

var playerHealth = 3

signal game_over

func update_score(score):
	$ScoreLabel.text = str(score)

func update_player_health():
	playerHealth -=1
	
	if playerHealth <= 0:
		playerHealth = 0
		game_over.emit()
	
	$PlayerHealthLabel.text = str(playerHealth)
