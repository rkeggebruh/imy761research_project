extends Node2D

var enterOnce = false

func _on_ready() -> void:
	State.is_in_dialog = true

func _process(_delta):
	if State.hideInstructions && !enterOnce:
		print("hiiiiiiiiiiide instructions")
		enterOnce = true
		$".".hide()
		State.is_in_dialog = false
