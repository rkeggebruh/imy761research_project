extends Node2D




func _on_mrs_otter_area_entered(area: Area2D) -> void:
	if(area.name == "cappy"):
		$AnimatedSprite2D.play('outline')



func _on_mrs_otter_area_exited(area: Area2D) -> void:
	if(area.name == "cappy"):
		$AnimatedSprite2D.play('idle')
