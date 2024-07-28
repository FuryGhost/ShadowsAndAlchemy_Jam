extends Node

@export var potion_ingredients: Array = [1, 2]
@export var final_ingredient: int = 1

const CURSOR_CENTER: Vector2 = Vector2(16, 16)

var _cauldron_contents: Array = []
var _selected_ingredient_index: int
var _show_light = false

@onready var open_hand_cursor: Resource = preload("res://art/cursor/OpenHandCursor_small.png")
@onready var closed_hand_cursor: Resource = preload("res://art/cursor/ClosedHandCursor_small.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	_set_cursor(open_hand_cursor)
	$SelectedContainer.hide()
	$Cauldron/Area2D/CollisionShape2D.disabled = true
	potion_ingredients.sort()
	$Light.hide()
	$Light.modulate.a = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if Input.is_action_just_pressed("click"):
		_set_cursor(closed_hand_cursor)
	elif Input.is_action_just_released("click"):
		_set_cursor(open_hand_cursor)
	
	if _show_light && $Light.modulate.a < 1:
		$Light.modulate.a += 0.5 * delta


func _set_cursor(cursor: Resource):
	Input.set_custom_mouse_cursor(cursor, Input.CURSOR_ARROW, CURSOR_CENTER)


func _on_container_on_table_container_selected(index, sound):
	_selected_ingredient_index = index
	
	$SelectedContainer.set_container(sound)
	$ContainersOnTable.hide()
	$SelectedContainer.show()
	$Cauldron/Area2D/CollisionShape2D.disabled = false


func _on_selected_container_hide():
	$SelectedContainer.hide()
	$ContainersOnTable.show()
	$Cauldron/Area2D/CollisionShape2D.disabled = true


func _on_cauldron_ingredient_added():
	_cauldron_contents.append(_selected_ingredient_index)
	
	if _selected_ingredient_index == final_ingredient:
		_cauldron_contents.sort()
		
		if _cauldron_contents == potion_ingredients:
			$Light.show()
			_show_light = true
