extends Area2D

@onready var timer: Timer = $Timer


#is player alive -> enemy_0,1,2.gd -> should enemy move.
var alive: bool = true

func _on_body_entered(body: Node2D) -> void:
	
	#checks body is player
	if body.name != "Player":
		return
	
	
	Engine.time_scale = 0.5 #slows down time
	body.get_node("CollisionShape2D").queue_free() #deletes player hitbox
	timer.start() #starts countdown before scene reset
	
	#death animation for player
	body.deathfunc()
	
	#tells enemy the player is dead
	alive = false


#resets scene
func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0 #resets time scale of engine
	get_tree().reload_current_scene() #resets scene
