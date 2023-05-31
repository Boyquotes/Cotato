extends Area2D

var speed = 0.15

func _physics_process(delta):
	position += ((get_parent().get_node("Player").position - position).normalized() * self.speed)
