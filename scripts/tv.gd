extends Node2D

var tvOn = false
var isInTvArea = false
var countdown_index = 0
var countdown_labels = []
var current_label: Label = null
var enterOnce = false

func _process(delta):
	
	if State.FillInTVLetterTime:
		$"Televisión".hide()
	if State.FillInTVLetterTimeTVOFF:
		$"Televisión".hide()
	
	if isInTvArea && State.TVFillInLettersCorrect:
		$tvAnimatedSprite.play('on')
		tvOn = true
		State.tvOn = true
		
	if isInTvArea && State.FillInTVLetterTimeTVOFF:
		$tvAnimatedSprite.play('off')
		tvOn = false
		State.tvOn = false


func _on_tv_area_area_entered(area: Area2D) -> void:
	if(area.name == "cappy"):
		$"Televisión".show()
		$AnimationPlayer.play("tvShow")
		$AudioStreamPlayer2D.play()
		isInTvArea = true
		#$outline.show()
		$LaMesa_outline.show()


func _on_tv_area_area_exited(area: Area2D) -> void:
	if(area.name == "cappy"):
		#$"Televisión".hide()
		$AnimationPlayer.play("tvHide")
		isInTvArea = false
		$outline.hide()
		$LaMesa_outline.hide()

func _on_ready() -> void:
	$"Televisión".hide()
	$outline.hide()
	$LaMesa_outline.hide()
	


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if anim_name == "tvHide":
		$"Televisión".hide()
