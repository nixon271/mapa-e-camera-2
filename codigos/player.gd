extends CharacterBody2D
const SPEED = 80.0
func _physics_process(delta: float) -> void:
	velocity = Vector2.ZERO

	if Input.is_action_pressed("ui_left"):
		velocity.x = -1 * SPEED
	if Input.is_action_pressed("ui_right"):
		velocity.x = 1 * SPEED
	if Input.is_action_pressed("ui_up"):
		velocity.y = -1 * SPEED
	if Input.is_action_pressed("ui_down"):
		velocity.y = 1 * SPEED
	move_and_slide()
	if get_slide_collision_count() > 0 :
		get_tree().reload_current_scene()

	if velocity == Vector2.ZERO: $corpo.play("idle")
	else: $corpo.play("andando")
	
	if velocity.x < 0.0: $"corpo".flip_h = true
	else: $"corpo".flip_h = false
	
