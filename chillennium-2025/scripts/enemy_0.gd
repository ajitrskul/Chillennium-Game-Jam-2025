extends CharacterBody2D

@onready var killzone: Area2D = $killzone

const SPEED: int = 100

var active: bool = false
var direction = Vector2.ZERO


func _on_activation_area_entered(area: Area2D) -> void:
	active = true

func _physics_process(delta: float) -> void:
	if active == true && killzone.alive == true: 
		direction = (get_parent().get_node("Player").position - position)
		direction /= direction.length()
		velocity = SPEED * direction
		
		move_and_slide()
