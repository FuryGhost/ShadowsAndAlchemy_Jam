extends Node2D

signal ingredient_added


# Called when the node enters the scene tree for the first time.
func _ready():
	$DownArrow.hide()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_mouse_entered():
	$DownArrow.show()


func _on_area_2d_mouse_exited():
	$DownArrow.hide()


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.pressed:
		ingredient_added.emit()
