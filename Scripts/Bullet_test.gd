extends Node2D

func enemyHit(area: KinematicBody2D):
	area.get_parent().queue_free()
