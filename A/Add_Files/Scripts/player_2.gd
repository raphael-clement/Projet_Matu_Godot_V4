extends CharacterBody2D


const SPEED = 100.0
const Ladder_gravity = 0.5 * SPEED
const JUMP_VELOCITY = -250.0


@onready var animated_sprite: AnimatedSprite2D = $AnimatedSprite2D
# @onready var ladder_collision_area: Area2D = $Area2D
var ladder_collision_area : bool = false
var direction : Vector2

#var screen_size # Size of the game window.

#func _ready():
#	screen_size = get_viewport_rect().size


func _on_area_2d_area_entered(area: Area2D) -> void:
	ladder_collision_area = true
	
func _on_area_2d_area_exited(area: Area2D) -> void:
	ladder_collision_area = false
	
func _physics_process(delta: float) -> void:
	
	if ladder_collision_area == true:
		_ladder_climb(delta)
		
	elif ladder_collision_area == false:
		_movement(delta)
		

func _ladder_climb(delta):

	#var direction := Vector2.ZERO
	#direction.x = Input.get_axis("Move_left","Move-right")
	#direction.y= Input.get_axis("Jump","ui_down")

	# if direction.x:
	#	velocity.x = direction.x * SPEED
	#if direction.y:
	#	velocity.y = direction.y * SPEED
	
	direction.x = Input.get_axis("Move_left","Move-right")
	print(direction.x)
	direction.y = Input.get_axis("Jump","ui_down")
	print(direction.y)
	
	
	if direction.x:
		velocity.x = direction.x * SPEED
	else:
		velocity.x = 0
	if direction.y:
		velocity.y = direction.y * SPEED
	else:
		velocity.y = Ladder_gravity
	
	move_and_slide()
"""
	var velocity = Vector2.ZERO # The player's movement vector.
	if Input.is_action_pressed(&"Move-right"):
		velocity.x += 1
	if Input.is_action_pressed(&"Move_left"):
		velocity.x -= 1
	if Input.is_action_pressed(&"ui_down"):
		velocity.y += 1
	if Input.is_action_pressed(&"Jump"):
		velocity.y -= 1

	if velocity.length() > 0:
		velocity = velocity.normalized() * SPEED
		$AnimatedSprite2D.play()
	else:
		$AnimatedSprite2D.stop()

	position += velocity * delta
	position = position.clamp(Vector2.ZERO, screen_size)
"""
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
