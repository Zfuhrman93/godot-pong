extends Node2D

var ai_speed = 200  # Adjust the AI's movement speed
var ai_damping = 0.08  # Adjust the damping effect for smoother movement
var error_range = 70 # Adjust the range of random errors
@onready var ball = get_parent().get_node("Ball")

func _process(delta):
	# Get the ball's position
	var ball_position = ball.global_position

	# Introduce random errors to the AI's movement
	var target_y = ball_position.y + randi() % (error_range * 2) - error_range

	# Move the AI paddle towards the updated target y-coordinate with damping effect
	var new_y = lerp(position.y, target_y, ai_damping)
	position.y = new_y

	# Limit the AI paddle's movement within the screen boundaries
	position.y = clamp(position.y, $Sprite.texture.get_height() / 2, get_viewport_rect().size.y - $Sprite.texture.get_height() / 2)
