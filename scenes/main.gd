extends Node

@onready var open_hand_cursor: Resource = preload("res://art/cursor/OpenHandCursor.png")
@onready var closed_hand_cursor: Resource = preload("res://art/cursor/ClosedHandCursor.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	Input.set_custom_mouse_cursor(open_hand_cursor)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_pressed("click"):
		Input.set_custom_mouse_cursor(closed_hand_cursor)
	else:
		Input.set_custom_mouse_cursor(open_hand_cursor)
