extends Node

const SAVEFILE = "user://save_data.txt"

var game_data = {}

func _ready():
	load_data()

func load_data():
	
	var file = FileAccess.open(SAVEFILE,FileAccess.READ)
	
	if file == null:
		game_data = {
			"master_volume": - 10
		}
		save_data()
	else:
		file.open(SAVEFILE,FileAccess.READ)
		game_data = file.get_var()
		return game_data

func save_data():
	var file = FileAccess.open(SAVEFILE,FileAccess.WRITE)
	file.store_var(game_data)

