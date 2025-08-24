extends Node2D

func _on_ready() -> void:
	$outline.hide()
	$"ElSofá".hide()

func _process(delta):
	if State.CRFillInLettersTimeSleep:
		$"ElSofá".hide()


func _on_couch_right_area_area_entered(area: Area2D) -> void:
	if(area.name == "cappy"):
		$"ElSofá".show()
		$AnimationPlayer.play("in")
		$outline.show()
		$AudioStreamPlayer2D.play()


func _on_couch_right_area_area_exited(area: Area2D) -> void:
	if(area.name == "cappy"):
		$AnimationPlayer.play("out")
		$outline.hide()
