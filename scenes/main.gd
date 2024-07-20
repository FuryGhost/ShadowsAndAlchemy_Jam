extends Node

const cursor_center: Vector2 = Vector2(32, 32)

@onready var open_hand_cursor: Resource = preload("res://art/cursor/OpenHandCursor_small.png")
@onready var closed_hand_cursor: Resource = preload("res://art/cursor/ClosedHandCursor_small.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_cursor(open_hand_cursor)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("click"):
		_set_cursor(closed_hand_cursor)
	elif Input.is_action_just_released("click"):
		_set_cursor(open_hand_cursor)


func _set_cursor(cursor: Resource):
	Input.set_custom_mouse_cursor(cursor, Input.CURSOR_ARROW, cursor_center)
