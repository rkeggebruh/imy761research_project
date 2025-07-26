extends Node2D

var tvOn = false
var isInTvArea = false
var countdown_index = 0
var countdown_labels = []
var current_label: Label = null
var enterOnce = false

func _process(delta):
	if isInTvArea && !enterOnce:
		start_countdown()
		enterOnce = true
	
	if isInTvArea && State.TVFillInLettersCorrect:
		$tvAnimatedSprite.play('on')
		tvOn = true
		
		#if Input.is_action_just_released("ui_accept") && !tvOn && State.TVFillInLettersCorrect:
			#$tvAnimatedSprite.play('on')
			#start_countdown()
			#tvOn = true
		#elif Input.is_action_just_released("ui_accept") && tvOn && State.TVFillInLettersCorrect:
			#$tvAnimatedSprite.play('off')
			#tvOn = false


func _on_tv_area_area_entered(area: Area2D) -> void:
	if(area.name == "cappy"):
		$AudioStreamPlayer2D.play()
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
		if current_label:
			current_label.hide()  # Hide previous immediately before showing next

		current_label = countdown_labels[countdown_index]
		current_label.show()
		countdown_index += 1

		$Timer2.start()
		$Timer.start()
	else:
		start_countdown()  # Restart loop




func _on_Timer2_timeout():
	if current_label:
		current_label.hide()




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
