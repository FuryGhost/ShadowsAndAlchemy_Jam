extends Node

const cursor_center: Vector2 = Vector2(16, 16)

@onready var open_hand_cursor: Resource = preload("res://art/cursor/OpenHandCursor_small.png")
@onready var closed_hand_cursor: Resource = preload("res://art/cursor/ClosedHandCursor_small.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_cursor(open_hand_cursor)
	$Area2D/ColorRect.mouse_filter = Control.MOUSE_FILTER_IGNORE


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("click"):
		_set_cursor(closed_hand_cursor)
		$ColorRectClick.color = Color("1a86e2")
	elif Input.is_action_just_released("click"):
		_set_cursor(open_hand_cursor)
		$ColorRectClick.color = Color("b2740f")


func _set_cursor(cursor: Resource):
	Input.set_custom_mouse_cursor(cursor, Input.CURSOR_ARROW, cursor_center)


func _on_area_2d_mouse_entered():
	$Area2D/ColorRect.color = Color(0.09, 0.292, 0.239)
	print("entered")


func _on_area_2d_mouse_exited():
	$Area2D/ColorRect.color = Color(0.345, 0.173, 0.341)
	print("exited")
