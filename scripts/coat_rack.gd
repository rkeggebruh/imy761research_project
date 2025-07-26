extends Node2D

func _ready():
	$outline.hide()
	$Perchero.hide()

func _on_coat_rack_area_area_entered(area: Area2D) -> void:
	if(area.name == "cappy"):
		$Perchero.show()
		$AudioStreamPlayer2D.play()
		$outline.show()
		$AnimationPlayer.play("fadeIn")


func _on_coat_rack_area_area_exited(area: Area2D) -> void:
	if(area.name == "cappy"):
		$outline.hide()
		$AnimationPlayer.play("fadeOut")
