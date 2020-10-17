extends Node2D

var mob = preload("res://dungeon/mob.tscn")





func _ready():
	var rand = RandomNumberGenerator.new()
	var mobscene = load("res://dungeon/mob.tscn")
	var screen_size = get_viewport().get_visible_rect().size
	for i in range(0,10):
		var enemy = mobscene.instance()
		rand.randomize()
		var x = rand.randf_range(0,screen_size.x)
		rand.randomize()
		var y = rand.randf_range(0,screen_size.y)
		enemy.position.y = y
		enemy.position.x = x
		add_child(enemy)
		#direction =  get_node("left ").get_global_position()
		#mob.linear_velocity = Vector2(enemy.position.y, enemy.position.x)
		#mob.linear_velocity = mob.linear_velocity.rotated(direction)

