extends CanvasLayer

@onready var animation_player: AnimationPlayer = $AnimationPlayer

var toScene: String = ""

#switched to true when first backwards played to stop repetition
var tracker: bool = false 

func change_scene(target: String) -> void:
	animation_player.play("fadechange")
	toScene = target
	tracker = false #allow backwards play to go


func _on_animation_player_animation_finished(_anim_name: StringName) -> void:
	if toScene != "" and tracker == false: #check if backwards play is allowed
		get_tree().change_scene_to_file(toScene)
		animation_player.play_backwards("fadechange")
		tracker = true
