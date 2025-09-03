extends CharacterBody2D


const SPEED = 100.0
const JUMP_VELOCITY = -250.0


@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
# @onready var ladder_collision_area: Area2D = $Area2D
var ladder_collision_area : bool = false

func _on_area_2d_area_entered(area: Area2D) -> void:
	ladder_collision_area = true
	print("in")
	
func _on_area_2d_area_exited(area: Area2D) -> void:
	ladder_collision_area = false
	print("out")
	
func _physics_process(delta: float) -> void:
	
	if ladder_collision_area == true:
		_ladder_climb(delta)
		
	elif ladder_collision_area == false:
		_movement(delta)
	
	else:
		print("Aaahhhhhhhhh!!!!!!!")
	

func _ladder_climb(delta):
	#var direction := Vector2.ZERO
	#direction.x = Input.get_axis("Move_left","Move-right")
	#direction.y= Input.get_axis("Jump","ui_down")
	
	# if direction.x:
	#	velocity.x = direction.x * SPEED
	#if direction.y:
	#	velocity.y = direction.y * SPEED
	var direction = Vector2.ZERO
	direction.x = Input.get_axis("Move_left","Move-right")
	if not Input.is_action_just_pressed("Jump"):
		velocity.y = 1 * SPEED
	elif Input.is_action_just_pressed("Jump"):
		velocity.y = -1 * SPEED
	else:
		print("FUUUUCK")

func _movement(delta):
	
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("Jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("Move_left", "Move-right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	

	# Play animation
	if is_on_floor():
		if velocity.x == 0:
			animated_sprite.play("idle")
		else:
			animated_sprite.play("run")
	elif Input.is_action_just_pressed("Jump") and is_on_floor():
		animated_sprite.play("jump")

	# Flip the sprite
	if velocity.x < 0:
		animated_sprite.flip_h = false
	elif velocity.x < 0:
		animated_sprite.flip_h = true
	
	move_and_slide()
