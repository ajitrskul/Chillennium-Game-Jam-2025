extends Node2D

@export var toObject: String = ""
@export_enum("Door", "Puzzle") var switchType: String
@onready var sprite_2d: Sprite2D = $Sprite2D

var switchVal: bool = false

func _ready() -> void:
	switchVal = false
	
func _process(delta: float) -> void:
	if switchVal == false and sprite_2d.flip_h == true:
		sprite_2d.flip_h = false

func _input(event: InputEvent) -> void:
	if Input.is_action_pressed("interact") and (get_parent().get_node("Player").position - position).length() < 350:
		switchVal = true
		sprite_2d.flip_h = true
		if switchType == "Door":
			get_parent().get_node(toObject).open()
		elif switchType == "Puzzle":
			get_parent().puzzle(name) # CHECK IF THIS CODE WORKS THIS IS ONLY THEORETICAL.
