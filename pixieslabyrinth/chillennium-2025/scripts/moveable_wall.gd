extends AnimatableBody2D

@onready var animation_player: AnimationPlayer = $AnimationPlayer

func open():
	animation_player.play("door_move")
