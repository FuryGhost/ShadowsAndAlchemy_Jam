extends Node2D

signal ingredient_added

var _show_failed: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$DownArrow.hide()
	$CauldronFailSprite.hide()
	$CauldronFailSprite.position = $CauldronSprite.position
	$CauldronFailSprite.modulate.a = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _show_failed && $CauldronFailSprite.modulate.a < 1:
		$CauldronFailSprite.modulate.a += 1.5 * delta


func _on_area_2d_mouse_entered():
	$DownArrow.show()


func _on_area_2d_mouse_exited():
	$DownArrow.hide()


func _on_area_2d_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.pressed:
		ingredient_added.emit()

func show_failed_cauldron():
	_show_failed = true
	$CauldronFailSprite.show()
