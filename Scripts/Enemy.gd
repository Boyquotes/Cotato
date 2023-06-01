extends KinematicBody2D

var speed = 0.15

# warning-ignore:unused_argument
func _physics_process(delta):
	position += ((get_parent().get_node("Player").position - position).normalized() * self.speed)
