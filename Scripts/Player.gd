extends Area2D

export var speed = 50
export var hp = 100
export var max_hp = 100
export var regen = 1
export var RegenTimer = 1

func _ready():
	$RegenTimer.set_wait_time(RegenTimer)
	$RegenTimer.start()

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
		velocity = velocity.normalized() * self.speed
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

func _on_Player_body_entered(body):
	if hp == 0:
			print("GG")
	elif get_parent().get_node("Enemy"):
		hp -= 1
	$RegenTimer.start()

func _on_RegenTimer_timeout():
	if hp < max_hp:
		hp += regen
	else:
		$RegenTimer.stop()
