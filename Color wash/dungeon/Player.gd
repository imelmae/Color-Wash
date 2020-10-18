extends KinematicBody2D

const ACCEL = 800
const MAX_SPEED = 200
const FRICTION = 800

var velocity = Vector2.ZERO
var spell = preload("res://dungeon/Spell.tscn")
var can_fire = true
var rate_of_fire = 0.1

func _process(delta):
	SkillLoop()

func _physics_process(delta):
	var input_vector = Vector2.ZERO
	input_vector.x = Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left")
	input_vector.y = Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	input_vector = input_vector.normalized()
	
	
	if input_vector != Vector2.ZERO:
		velocity += input_vector * ACCEL * delta
		velocity = velocity.clamped(MAX_SPEED)
		#$AnimatedSprite.animation = "walk"
	else:
		velocity = velocity.move_toward(Vector2.ZERO, FRICTION * delta)
		
		
		
	velocity = move_and_slide(velocity)
	
	
	
func SkillLoop():
	if Input.is_action_pressed("shoot") and can_fire == true:
		can_fire = false
		get_node("left ").rotation = get_angle_to(get_global_mouse_position())
		var spell_instance = spell.instance()
		spell_instance.position = get_node("left /right").get_global_position()
		spell_instance.rotation = get_angle_to(get_global_mouse_position())
		get_parent().add_child(spell_instance)
		yield(get_tree().create_timer(rate_of_fire),"timeout")
		can_fire = true
		#$AnimatedSprite.animation = "shooting"
		



func _on_hurtbox_area_entered(area):
	queue_free()
