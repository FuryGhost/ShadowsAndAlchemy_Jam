extends Node2D

@export var container_index: int = 1
@export var sound: Resource

signal container_selected(index: int, sound: Resource)


# Called when the node enters the scene tree for the first time.
func _ready():
	$UpArrow.modulate.a = 0.3


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.pressed:
		container_selected.emit(container_index, sound)


func _on_area_2d_mouse_entered():
	$UpArrow.modulate.a = 1


func _on_area_2d_mouse_exited():
	$UpArrow.modulate.a = 0.3
