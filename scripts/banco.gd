extends Node2D

var inBench = false

func _ready():
	$"El banco".hide()
	$NeutralBenchOutline.hide()

func _process(delta) -> void:
	if (State.BenchFillInLettersTimeOn && inBench):
		$"El banco".hide()
	
	if(State.BenchFillInLettersTimeOff && inBench):
		$"El banco".hide()

func _on_bench_area_area_entered(area: Area2D) -> void:
	if(area.name == "cappy"):
		inBench = true
		$"El banco".show()
		$AnimationPlayer.play("fade_in")
		$AudioStreamPlayer2D.play()
		$NeutralBenchOutline.show()


func _on_bench_area_area_exited(area: Area2D) -> void:
	if(area.name == "cappy"):
		inBench = false
		$AnimationPlayer.play("fade_out")
		$NeutralBenchOutline.hide()


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	if(anim_name == "fade_out"):
		$"El banco".hide()
