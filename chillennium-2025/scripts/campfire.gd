extends Node2D

@export var DestinationScene: String = ""


func _input(event: InputEvent) -> void:
	if event.is_action_pressed("interact"):
		var PlayerPosition: Vector2 = get_parent().get_node("Player").position - position
		if PlayerPosition.length() < 700: 
			print("You are close")
			SceneChanger.change_scene("res://scenes/" + DestinationScene + ".tscn")
