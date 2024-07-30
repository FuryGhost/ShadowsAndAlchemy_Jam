extends CanvasLayer


signal start_play


# Called when the node enters the scene tree for the first time.
func _ready():
	$StartScreen.show()
	$ShatteredPotion.hide()
	$DarkBackground.hide()
	$NextButton/NextButtonSprite.modulate.a = 0.7


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass


func _on_next_button_mouse_entered():
	$NextButton/NextButtonSprite.modulate.a = 1


func _on_next_button_mouse_exited():
	$NextButton/NextButtonSprite.modulate.a = 0.7


func _on_next_button_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton && event.pressed:
		if $StartScreen.visible:
			$ShatteredPotion.show()
			$StartScreen.hide()
			$ShatterAudioPlayer.play()
		elif $ShatteredPotion.visible:
			$DarkBackground.show()
			$ShatteredPotion.hide()
			$ButtonClickAudioPlayer.play()
		else:
			$ButtonClickAudioPlayer.play()
			start_play.emit()
