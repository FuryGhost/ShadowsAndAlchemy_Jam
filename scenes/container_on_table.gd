extends Node2D

@export var container_index: int = 1

signal container_selected(index: int)


# Called when the node enters the scene tree for the first time.
func _ready():
	$UpArrow.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.pressed:
		container_selected.emit(container_index)


func _on_area_2d_mouse_entered():
	$UpArrow.show()


func _on_area_2d_mouse_exited():
	$UpArrow.hide()
