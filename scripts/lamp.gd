extends Node2D

var inLampArea = false
var lampOn = false
var fade_time := 0.0

func _process(delta):
	if inLampArea:
		if State.lampCanBeSwitchedOn:
			$on.show()
			lampOn = true
		#if Input.is_action_just_released("ui_accept") && !lampOn:
			#if State.lampCanBeSwitchedOn:
				#$on.show()
				#lampOn = true
		#elif Input.is_action_just_released("ui_accept") && lampOn:
			#$on.hide()
			#lampOn = false

func _on_ready() -> void:
	$outline.hide()
	$"Lámpara".hide()
	$on.hide()


func _on_lamp_area_area_entered(area: Area2D) -> void:
	if(area.name == "cappy"):
		$"Lámpara".show()
		inLampArea = true
		State.inLamp = true
		$AudioStreamPlayer2D.play()
		$AnimationPlayer.play("fadeIn")
		$outline.show()


func _on_lamp_area_area_exited(area: Area2D) -> void:
	if(area.name == "cappy"):
		inLampArea = false
		State.inLamp = false
		$AnimationPlayer.play("fadeOut")
		$outline.hide()
