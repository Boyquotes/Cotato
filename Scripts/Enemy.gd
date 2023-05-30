extends "res://Scripts/Entity.gd"

func _ready():
	speed = 10

func _physics_process(delta):
	move_and_slide((get_parent().get_node("Player").position - position).normalized() * self.speed)
