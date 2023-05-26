extends "res://Scripts/Entity.gd"

var stands = true
var destination = Vector2()
var velocity = Vector2()
var prev_pos = Vector2()

var target = null

func _ready():
	speed = 45

func _physics_process(delta):
	if velocity:
		prev_pos = position
		move_and_slide(velocity)
		position.x = clamp(position.x, 0, 10000)
		position.y = clamp(position.y, 0, 10000)
	wander()
	search_for_target()

func search_for_target():
	var pl = get_parent().get_parent().get_player()
	if position.distance_to(pl.position) < 200:
		cancel_movement()
		target = pl
		
	else:
		if target:
			cancel_movement()
		target = null
		
	if target:
		set_destionation(target.position)

func set_destionation(dest):
	destination = dest
	velocity = (destination - position).normalized() * speed
	stands = false

func cancel_movement():
	velocity = Vector2()
	destination = Vector2()
	$StandingTimer.start(2)

func wander():
	var pos = position
	if stands:
		randomize()
		
		var x = int(rand_range(pos.x - 150, pos.x + 150))
		var y = int(rand_range(pos.y - 150, pos.y + 150))
		
		x = clamp(x, 0, 10000)
		y = clamp(y, 0, 10000)
		
		set_destionation(Vector2(x, y))
		
	elif velocity != Vector2():
		if pos.distance_to(destination) <= speed:
			cancel_movement()
		elif pos.distance_to(prev_pos) <= 0.6:
			cancel_movement()


func _on_StandingTimer_timeout():
	stands = true
