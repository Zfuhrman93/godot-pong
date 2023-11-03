extends Node2D

# Declare member variables here. Examples:
var speed = 600  # Adjust the speed of the paddle movement

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		# Move the paddle up when the 'W' key is pressed
		if Input.is_action_pressed("Up"):
				move_paddle(-1, delta)
				
		# Move the paddle down when the 'S' key is pressed
		if Input.is_action_pressed("Down"):
				move_paddle(1, delta)

func move_paddle(direction, delta):
	var new_y = position.y + direction * speed * delta
	var max_y = get_viewport_rect().size.y - ($Sprite.texture.get_height() / 2)
	new_y = clamp(new_y, ($Sprite.texture.get_height() / 2), max_y)
	position.y = new_y
