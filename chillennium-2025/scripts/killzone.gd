extends Area2D

@onready var timer: Timer = $Timer

var alive: bool = true

func _on_body_entered(body: Node2D) -> void:
	
	print("You died!") #delete when death animation finalized
	Engine.time_scale = 0.5
	body.get_node("CollisionShape2D").queue_free()
	timer.start()
	if (get_parent().name == "Enemy0"):
		get_parent().get_parent().get_node("Player").deathfunc()
		alive = false
		

func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	get_tree().reload_current_scene()
