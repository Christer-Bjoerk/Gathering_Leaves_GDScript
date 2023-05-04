extends ParallaxBackground

@export var background_speed = 100

func _process(delta):
	scroll_base_offset.x -= background_speed * delta
