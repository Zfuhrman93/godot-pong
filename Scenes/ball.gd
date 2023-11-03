extends Area2D

var ball_speed = 350
var velocity = Vector2((ball_speed * -1), ball_speed) # Initial velocity of the ball
var bounce_adjust = 250

func _process(delta):
	position += velocity * delta
	if position.y > (get_viewport_rect().size.y - ($Sprite.texture.get_height() / 2)) or position.y < (0 + ($Sprite.texture.get_height() / 2)):
		velocity.y *= -1
	if position.x > (get_viewport_rect().size.x - ($Sprite.texture.get_width() / 2)):
		_score("ai")
	if position.x < (0 + ($Sprite.texture.get_width() / 2)):
		_score("player")

func _score(side):
	position = get_viewport_rect().size / 2
	if side == "player":
		Scores.AI_score += 1
	if side == "ai":
		Scores.player_score += 1
	print("Player: " + str(Scores.player_score) + " AI: " + str(Scores.AI_score))

func _on_area_entered(area):
	if area.is_in_group("paddle_group"): 
		var sprite = area.get_node("Sprite")
		var collision_point = area.to_local(transform.origin) # Get the collision point in local coordinates of the paddle        
		var hit_position = (collision_point.y / (sprite.texture.get_height() / 2)) # Calculate the hit position as a value between -1 and 1 based on the collision point's y-coordinate
		modify_ball_velocity(hit_position) # Modify the ball's velocity based on hit_position

func modify_ball_velocity(hit_position):
		# Modify the ball's velocity based on hit_position
		# Example: Reverse the X component of velocity and adjust the Y component based on hit_position
	velocity.x *= -1
	velocity.y = hit_position * bounce_adjust  # Adjust some_value to control the angle of the ball's bounce
