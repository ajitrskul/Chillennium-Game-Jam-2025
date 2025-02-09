extends CharacterBody2D

@onready var killzone: Area2D = $killzone
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

#Speed const
const SPEED: int = 100

var active: bool = false
var playerInRange: bool = false
var direction = Vector2.ZERO
@onready var player: Player = $"../Player"

func _ready() -> void:
	animated_sprite_2d.sprite_frames.set_animation_speed("new_animation", 2)

func _on_activation_body_entered(body: Node2D) -> void:
	if body.name != "Player":
		return
	else:
		playerInRange = true
		
	if player.current_lantern_num == 0:
		active = true

func _on_activation_body_exited(body: Node2D) -> void:
	if body.name != "Player":
		return
	elif playerInRange == true:
		playerInRange = false

	

	
func _physics_process(_delta: float) -> void:
	if player.current_lantern_num != null and player.current_lantern_num == 0:
		if get_collision_layer_value(1) == false:
			set_collision_layer_value(1, true)
		
		if animated_sprite_2d.visible == false:
			animated_sprite_2d.visible = true
		
		if playerInRange and not active:
			active = true
		if active == true and killzone.alive == true: 
			direction = (get_parent().get_node("Player").position - position)
			direction /= direction.length()
			velocity = SPEED * direction
			if velocity.length() > 0:
				animated_sprite_2d.sprite_frames.set_animation_speed("new_animation", 5)
			else:
				animated_sprite_2d.sprite_frames.set_animation_speed("new_animation", 2)
			
			move_and_slide()
	else:
		if get_collision_layer_value(1) == true:
			set_collision_layer_value(1, false)
		if animated_sprite_2d.visible == true:
			animated_sprite_2d.visible = false
		
