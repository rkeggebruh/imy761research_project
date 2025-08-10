extends Node2D

#func _process(_delta):
	#if State.otterMoving:
		#$AnimatedSprite2D.play("walk")

func _on_mrs_otter_area_entered(area: Area2D) -> void:
	if(area.name == "cappy"):
		State.otterSpeed = 0
		$AnimatedSprite2D.play('outline')



func _on_mrs_otter_area_exited(area: Area2D) -> void:
	if(area.name == "cappy"):
		State.otterSpeed = 0.09
		$AnimatedSprite2D.play('walk')
