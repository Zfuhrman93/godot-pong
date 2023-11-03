extends Node2D

var ai_speed = 200  # Adjust the AI's movement speed
var ai_damping = 0.1  # Adjust the damping effect for smoother movement
@onready var ball = get_parent().get_node("Ball")

func _process(delta):
	# Get the ball's position
	var ball_position = ball.global_position
	
	# Check if the ball is moving towards the AI paddle
	if ball.velocity.x > 0:
		# Move the AI paddle towards the ball's y-coordinate with damping effect
		var target_y = ball_position.y
		var new_y = lerp(position.y, target_y, ai_damping)
		position.y = new_y
		
		# Limit the AI paddle's movement within the screen boundaries
		position.y = clamp(position.y, $Sprite.texture.get_height() / 2, get_viewport_rect().size.y - $Sprite.texture.get_height() / 2)
