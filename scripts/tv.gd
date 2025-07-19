extends Node2D

var tvOn = false
var isInTvArea = false

func _process(delta):
	if isInTvArea:
		if Input.is_action_just_released("ui_accept") && !tvOn:
			$tvAnimatedSprite.play('on')
			tvOn = true
		elif Input.is_action_just_released("ui_accept") && tvOn:
			$tvAnimatedSprite.play('off')
			tvOn = false


func _on_tv_area_area_entered(area: Area2D) -> void:
	if(area.name == "cappy"):
		isInTvArea = true
		$outline.show()


func _on_tv_area_area_exited(area: Area2D) -> void:
	if(area.name == "cappy"):
		isInTvArea = false
		$outline.hide()


func _on_ready() -> void:
	$outline.hide()
