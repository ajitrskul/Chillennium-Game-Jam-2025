extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var toScene: String = ""

func change_scene(target: String) -> void:
	animation_player.play("fadechange")
	toScene = target


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	if toScene != "":
		get_tree().change_scene_to_file(toScene)
		animation_player.play_backwards("fadechange")
