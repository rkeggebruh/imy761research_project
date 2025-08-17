extends Node2D

func _process(delta):
	if State.boomBoxFillInLettersTimeOn:
		$LaRadio.hide()
	if State.boomBoxFillInLettersTimeOff:
		$LaRadio.hide()

func _on_ready() -> void:
	$outline.hide()
	$EaselOutline.hide()
	$LaRadio.hide()
	

func _on_boombox_area_area_entered(area: Area2D) -> void:
	if(area.name == "cappy"):
		$LaRadio.show()
		$AudioStreamPlayer2D.play()
		$AnimationPlayer.play("in")
		$EaselOutline.show()
		#$outline.show()


func _on_boombox_area_area_exited(area: Area2D) -> void:
	if(area.name == "cappy"):
		$AnimationPlayer.play("out")
		$EaselOutline.hide()
		#$outline.hide()
