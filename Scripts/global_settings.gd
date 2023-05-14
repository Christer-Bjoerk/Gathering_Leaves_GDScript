extends Node

func update_master_volume(value):
	AudioServer.set_bus_volume_db(0,value)
	Save.game_data.master_volume = value
	Save.save_data()

func update_sfx_volume(value):
	AudioServer.set_bus_volume_db(1,value)
	Save.game_data.sfx_volume = value
	Save.save_data()
