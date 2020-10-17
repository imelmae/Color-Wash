extends KinematicBody2D

onready var stats = $stats


func _ready():
	pass # Replace with function body.



func _on_hurtbox_area_entered(area):
	stats.health -= 1
	if stats.health < 0:
		queue_free()
