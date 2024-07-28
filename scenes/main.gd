extends Node

@export var potion_ingredients: Array = [1, 2]
@export var final_ingredient: int = 1

const CURSOR_CENTER: Vector2 = Vector2(16, 16)

var _cauldron_contents: Array = []

@onready var open_hand_cursor: Resource = preload("res://art/cursor/OpenHandCursor_small.png")
@onready var closed_hand_cursor: Resource = preload("res://art/cursor/ClosedHandCursor_small.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_cursor(open_hand_cursor)
	$SelectedContainer.hide()
	$Cauldron/Area2D/CollisionShape2D.disabled = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("click"):
		_set_cursor(closed_hand_cursor)
	elif Input.is_action_just_released("click"):
		_set_cursor(open_hand_cursor)


func _set_cursor(cursor: Resource):
	Input.set_custom_mouse_cursor(cursor, Input.CURSOR_ARROW, CURSOR_CENTER)


func _on_container_on_table_container_selected(index, sound):
	$SelectedContainer.set_container(sound)
	$ContainersOnTable.hide()
	$SelectedContainer.show()
	$Cauldron/Area2D/CollisionShape2D.disabled = false


func _on_selected_container_hide():
	$SelectedContainer.hide()
	$ContainersOnTable.show()
	$Cauldron/Area2D/CollisionShape2D.disabled = true
