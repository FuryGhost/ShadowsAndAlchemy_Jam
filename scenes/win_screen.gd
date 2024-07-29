extends CanvasLayer


var _show_light = false


# Called when the node enters the scene tree for the first time.
func _ready():
	$Light.modulate.a = 0
	$Contents.modulate.a = 0


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if _show_light && $Light.modulate.a < 1:
		$Light.modulate.a += 0.3 * delta
	if $Light.modulate.a >= 1 && $Contents.modulate.a < 1:
		$Contents.modulate.a += 1 * delta


func _on_visibility_changed():
	if visible:
		_show_light = true
