extends Node2D



func _on_ready() -> void:
	$outline.hide()
	

func _on_boombox_area_area_entered(area: Area2D) -> void:
	if(area.name == "cappy"):
		$outline.show()


func _on_boombox_area_area_exited(area: Area2D) -> void:
	if(area.name == "cappy"):
		$outline.hide()
