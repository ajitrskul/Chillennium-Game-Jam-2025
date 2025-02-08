class_name Player extends CharacterBody2D


const SPEED = 32000.0
@onready var sprite: AnimatedSprite2D = $AnimatedSprite2D
@onready var yellow_lantern: PointLight2D = $"yellow-lantern"
@onready var red_lantern: PointLight2D = $"red-lantern"
@onready var blue_lantern: PointLight2D = $"blue-lantern"

@onready var current_lantern: PointLight2D = yellow_lantern
var has_red: bool = false
var has_blue: bool = false


#var current_lantern: PointLight2D = $"yellow-lantern"

var isAlive: bool

func _ready() -> void:
	isAlive = true

func deathfunc() -> void:	
	isAlive = false
	print("success")
	

func _physics_process(delta: float) -> void:
	
	if isAlive == false:
		return
		
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
			current_lantern.position = Vector2(85, -40)
		else: #left
			sprite.rotation_degrees = 90
			current_lantern.position = Vector2(-85, -40)
	elif direction.y < 0: #up
		sprite.rotation_degrees = -180
		current_lantern.position = Vector2(-85, -40)
	elif direction.y > 0: #down
		sprite.rotation_degrees = 0
		current_lantern.position = Vector2(40, 85)
	
	velocity = direction * SPEED * delta
	move_and_collide(direction)
	move_and_slide()
