extends Node2D

var enterOnce = false
var enterOnce1 = false

func _on_ready() -> void:
	$Label3.hide()
	State.is_in_dialog = true

func _process(_delta):
	if State.showSecondInstruction && !enterOnce1:
		print("showing the second from game")
		enterOnce1 = true
		$Label.hide()
		$Label2.hide()
		$Label3.show()
		#$flowerOne.hide()
		#$AnimatedSprite2D.hide()
		#$AnimatedSprite2D2.hide()
		#$AnimatedSprite2D3.hide()
	if State.hideInstructions && !enterOnce:
		#print("hiiiiiiiiiiide instructions")
		enterOnce = true
		$".".hide()
		State.is_in_dialog = false
