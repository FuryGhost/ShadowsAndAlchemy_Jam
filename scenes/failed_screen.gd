extends CanvasLayer


var _show_contents: bool = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$Contents.modulate.a = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _show_contents && $Contents.modulate.a < 1:
		$Contents.modulate.a += 1.5 * delta


func _on_visibility_changed():
	if visible:
		_show_contents = true
