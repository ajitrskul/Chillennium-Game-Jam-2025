extends CharacterBody2D

@onready var killzone: Area2D = $killzone
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

#Speed const
const SPEED: int = 100

var active: bool = false
var direction = Vector2.ZERO

func _ready() -> void:
	animated_sprite_2d.sprite_frames.set_animation_speed("new_animation", 2)

func _on_activation_body_entered(body: Node2D) -> void:
	
	if body.name != "Player":
		return
		
	active = true
	

	
func _physics_process(_delta: float) -> void:
	if active == true && killzone.alive == true: 
		direction = (get_parent().get_node("Player").position - position)
		direction /= direction.length()
		velocity = SPEED * direction
		if velocity.length() > 0:
			animated_sprite_2d.sprite_frames.set_animation_speed("new_animation", 5)
		else:
			animated_sprite_2d.sprite_frames.set_animation_speed("new_animation", 2)
		
		move_and_slide()
