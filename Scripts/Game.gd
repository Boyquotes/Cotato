extends Node2D

var enemy_scene = preload("res://Scenes/Enemy.tscn")

func _on_Timer_timeout():
	#Spawner mobs
	var enemy = enemy_scene.instance()
	add_child(enemy)
	enemy.position = get_node("Player").position + Vector2(210, 0).rotated(rand_range(0, 2*PI))
