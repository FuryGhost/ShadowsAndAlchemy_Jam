extends CanvasLayer

signal start_game


# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D/StartButton.modulate.a = 0.7


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_area_2d_mouse_entered():
	$Area2D/StartButton.modulate.a = 1


func _on_area_2d_mouse_exited():
	$Area2D/StartButton.modulate.a = 0.7


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.pressed:
		start_game.emit()
		$AudioStreamPlayer2D.play()
