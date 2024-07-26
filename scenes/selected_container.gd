extends Node2D

signal hide

const CONTAINER_SOUNDS = {
	1: preload("res://audio/container_shakes/single coin in glass jar electric.wav"),
	2: preload("res://audio/container_shakes/fava can.wav")
}

var _shake_container = false

# Called when the node enters the scene tree for the first time.
func _ready():
	$Path2D/PathFollow2D.loop = false
	$Path2D/PathFollow2D.progress = 0
	$ContainerImage.position = $Path2D/PathFollow2D.position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if $Path2D/PathFollow2D.progress_ratio < 1:
		if _shake_container:
			$Path2D/PathFollow2D.progress += 500 * delta
			$ContainerImage.position = $Path2D/PathFollow2D.position
	else:
		_shake_container = false
		$Path2D/PathFollow2D.progress = 0
		$ContainerImage.position = $Path2D/PathFollow2D.position


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.pressed && !_shake_container:
		_shake_container = true;
		$AudioStreamPlayer2D.play()


func _on_back_arrow_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.pressed:
		$AudioStreamPlayer2D.stop()
		hide.emit()
		_shake_container = false
		$Path2D/PathFollow2D.progress = 0
		$ContainerImage.position = $Path2D/PathFollow2D.position


func set_container_index(index: int):
	$AudioStreamPlayer2D.stream = CONTAINER_SOUNDS[index]
