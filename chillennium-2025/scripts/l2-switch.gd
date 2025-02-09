extends Node2D

@export var toObject: String = ""
@export_enum("Door", "Puzzle") var switchType: String
@onready var sprite_2d: Sprite2D = $Sprite2D

var switchVal: bool = false

func _ready() -> void:
	switchVal = false

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("interact") and (get_parent().get_node("Player").position - position).length() < 350 and switchVal == false:
		switchVal = true
		sprite_2d.rotation_degrees += 90
		if switchType == "Door":
			get_parent().get_node(toObject).open()
		elif switchType == "Puzzle":
			get_parent().get_node(toObject).puzzle(name) # CHECK IF THIS CODE WORKS THIS IS ONLY THEORETICAL.
