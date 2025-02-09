extends Control




func _on_video_stream_player_finished() -> void:
	SceneChanger.change_scene("res://scenes/level-1.tscn")
