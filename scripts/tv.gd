extends Node2D

var tvOn = false
var isInTvArea = false
var countdown_index = 0
var countdown_labels = []

func _process(delta):
	if isInTvArea:
		if Input.is_action_just_released("ui_accept") && !tvOn:
			$tvAnimatedSprite.play('on')
			start_countdown()
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

func start_countdown():
	countdown_index = 0
	for label in countdown_labels:
		label.hide()
	$Timer.start()



func _on_Timer_timeout():
	if countdown_index < countdown_labels.size():
		var current_label = countdown_labels[countdown_index]
		current_label.show()
		$Timer2.start()  # Start timer to hide this label
		countdown_index += 1
		$Timer.start()   # Continue to next number
	else:
		# Restart countdown
		start_countdown()



func _on_Timer2_timeout():
	if countdown_index > 0:
		countdown_labels[countdown_index - 1].hide()



func _on_ready() -> void:
	countdown_labels = [
		$"1", $"2", $"3", $"4", $"5",
		$"6", $"7", $"8", $"9", $"10"
	]
	
	$outline.hide()
	for label in countdown_labels:
		label.hide()
	
	countdown_labels = [$"1", $"2", $"3", $"4", $"5", $"6", $"7", $"8", $"9", $"10"]
	$Timer.connect("timeout", Callable(self, "_on_Timer_timeout"))
	$Timer2.connect("timeout", Callable(self, "_on_Timer2_timeout"))
