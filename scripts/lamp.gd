extends Node2D

var inLampArea = false
var lampOn = false

func _process(delta):
	if inLampArea:
		if Input.is_action_just_released("ui_accept") && !lampOn:
			$on.show()
			lampOn = true
		elif Input.is_action_just_released("ui_accept") && lampOn:
			$on.hide()
			lampOn = false

func _on_ready() -> void:
	$outline.hide()
	$on.hide()


func _on_lamp_area_area_entered(area: Area2D) -> void:
	if(area.name == "cappy"):
		inLampArea = true
		State.inLamp = true
		$outline.show()


func _on_lamp_area_area_exited(area: Area2D) -> void:
	if(area.name == "cappy"):
		inLampArea = false
		State.inLamp = false
		$outline.hide()
