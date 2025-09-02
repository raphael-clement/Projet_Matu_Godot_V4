extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -250.0

@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var ladder_ray_cast: RayCast2D = %RayCast2D


func _physics_process(delta: float) -> void:
	
	var ladderCollider = ladder_ray_cast.is_colliding()
	
	if ladderCollider == true:
		_ladder_climb(delta)
		print("ladder")
	
	else:
		_movement(delta)
	
	_movement(delta)

func _ladder_climb(delta):
	var direction := Vector2.ZERO
	direction.x = Input.get_axis("Move_left","Move_right")
	direction.y= Input.get_axis("Move_up","Move_down")
	
	if direction != Vector2.ZERO:
		velocity = direction * SPEED / 2
	else:
		velocity = Vector2.ZERO

func _movement(delta):
	
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Move_up") and is_on_floor():
		velocity.y = JUMP_VELOCITY
	
	# Flip the sprite
	if velocity.x < 0:
		animated_sprite.flip_h = false
	elif velocity.x < 0:
		animated_sprite.flip_h = true

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Move_left", "Move-right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()
	
	# Play animation
	if is_on_floor():
		if velocity.x == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	elif Input.is_action_just_pressed("Move_up") and is_on_floor():
		animated_sprite.play("jump")
