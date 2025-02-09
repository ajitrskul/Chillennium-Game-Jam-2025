extends Sprite2D
@onready var animation_player: AnimationPlayer = $"../AnimationPlayer"


func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("interact"):
		var PlayerPosition: Vector2 = get_parent().get_node("Player").position - position
		if PlayerPosition.length() < 300:
			animation_player.play("Sign1Disp")
