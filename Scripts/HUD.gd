extends CanvasLayer

var playerHealth = 3

func update_score(score):
	$ScoreLabel.text = str(score)

func update_player_health():
	playerHealth -=1
	$PlayerHealthLabel.text = str(playerHealth)
