extends "res://Scripts/Entity.gd"

func _process(delta):
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed("move_right"):
		velocity.x += 1
	if Input.is_action_pressed("move_left"):
		velocity.x -= 1
	if Input.is_action_pressed("move_down"):
		velocity.y += 1
	if Input.is_action_pressed("move_up"):
		velocity.y -= 1
		
	if velocity.length() > 0:
		velocity = velocity.normalized() * speed
		$AnimatedSprite.play()
		
	if velocity.x != 0 || velocity.y != 0:
		$AnimatedSprite.animation = "run"
		$AnimatedSprite.flip_v = false
		# See the note below about boolean assignment.
		$AnimatedSprite.flip_h = velocity.x < 0
	elif velocity.x == 0:
		$AnimatedSprite.animation = "idle"
		
	position += velocity * delta
	position.x = clamp(position.x, 0, 10000)
	position.y = clamp(position.y, 0, 10000)
