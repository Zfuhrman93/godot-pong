extends Area2D

var velocity = Vector2(200, 0) # Initial velocity of the ball
var bounce_adjust = 200

func _process(delta):
	position += velocity * delta

func _on_area_entered(area):
	if area.is_in_group("paddle_group"): 
		var collision_point = area.to_local(transform.origin) # Get the collision point in local coordinates of the paddle        
		var hit_position = (collision_point.y / (64 / 2)) # Calculate the hit position as a value between -1 and 1 based on the collision point's y-coordinate
		modify_ball_velocity(hit_position) # Modify the ball's velocity based on hit_position

func modify_ball_velocity(hit_position):
		# Modify the ball's velocity based on hit_position
		# Example: Reverse the X component of velocity and adjust the Y component based on hit_position
	velocity.x *= -1
	velocity.y = hit_position * bounce_adjust  # Adjust some_value to control the angle of the ball's bounce
