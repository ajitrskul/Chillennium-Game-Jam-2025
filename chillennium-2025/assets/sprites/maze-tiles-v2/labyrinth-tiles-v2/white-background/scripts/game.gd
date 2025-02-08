extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(get_tree().current_scene.name)  # Should print the main scene name
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
