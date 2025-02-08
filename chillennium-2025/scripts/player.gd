class_name Player extends CharacterBody2D

const SPEED = 32000.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var light: PointLight2D = $PointLight2D

func _physics_process(delta: float) -> void:
	#create 2d vector
	var direction = Vector2.ZERO
	#check for player input
	if Input.is_action_pressed("move_up"):
		direction.y -= 1
	if Input.is_action_pressed("move_down"):
		direction.y += 1
	if Input.is_action_pressed("move_left"):
		direction.x -= 1
	if Input.is_action_pressed("move_right"):
		direction.x += 1 

	#normalizes vector
	if direction != Vector2.ZERO:
		direction = direction.normalized()	
	
	if direction.x != 0:
		if direction.x > 0: #right
			sprite.rotation_degrees = -90
			light.position = Vector2(85, -40)
		else: #left
			sprite.rotation_degrees = 90
			light.position = Vector2(-85, -40)
	elif direction.y < 0: #up
		sprite.rotation_degrees = -180
		light.position = Vector2(-85, -40)
	elif direction.y > 0: #down
		sprite.rotation_degrees = 0
		light.position = Vector2(40, 85)
	
	velocity = direction * SPEED * delta
	move_and_collide(direction)
	move_and_slide()
