extends Node2D

var enterOnce = false
var inCoatRack = false

func _ready():
	$outline.hide()
	$Perchero.hide()

func _process(delta):
	if State.coatRackFillInLettersTimeOn:
		$Perchero.hide()

func _on_coat_rack_area_area_entered(area: Area2D) -> void:
	if(area.name == "cappy"):
		inCoatRack = true
		$Perchero.show()
		$AudioStreamPlayer2D.play()
		$outline.show()
		$AnimationPlayer.play("fadeIn")


func _on_coat_rack_area_area_exited(area: Area2D) -> void:
	if(area.name == "cappy"):
		inCoatRack = false
		$outline.hide()
		$AnimationPlayer.play("fadeOut")
