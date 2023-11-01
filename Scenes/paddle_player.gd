extends Node2D

# Declare member variables here. Examples:
var speed = 300  # Adjust the speed of the paddle movement

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
		# Move the paddle up when the 'W' key is pressed
		if Input.is_action_pressed("Up"):
				move_paddle(-1, delta)
				
		# Move the paddle down when the 'S' key is pressed
		if Input.is_action_pressed("Down"):
				move_paddle(1, delta)

# Function to move the paddle
func move_paddle(direction, delta):
		# Calculate the new position of the paddle based on the speed and direction
		var new_y = position.y + direction * speed * delta
		
		# Limit the paddle's movement within the screen boundaries
		new_y = clamp(new_y, 0, get_viewport_rect().size.y - $Sprite.texture.get_height())
		
		# Set the paddle's position
		position.y = new_y
