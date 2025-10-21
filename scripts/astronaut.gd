extends CharacterBody2D

@export var bullet_scene:PackedScene

const SPEED = 100.0
const JUMP_VELOCITY = -150.0
const GRAVITY = 200.0

var can_shoot := true

func _process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity.y += GRAVITY * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	if Input.is_action_just_pressed("shoot") and can_shoot:
		shoot()

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func shoot():
	var bullet_instance = bullet_scene.instantiate()
	var bullet_dir = position.direction_to(get_viewport().get_mouse_position())
	bullet_instance.direction = bullet_dir
	bullet_instance.position = global_position
	add_sibling(bullet_instance)
	can_shoot = false
	$shootTimer.start()
	
	
	


func _on_shoot_timer_timeout() -> void:
	can_shoot = true
