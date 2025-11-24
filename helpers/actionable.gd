extends Area2D


@export var dialogue_resource: DialogueResource
@export var dialogue_start: String = "start"

func _action() -> void:
	if !State.BenchFillInLettersTimeOn || !State.BenchFillInLettersTimeOff || State.CRFillInLettersTimeSleepTwo || State.CRFillInLettersTimeSleep:
		DialogueManager.show_example_dialogue_balloon(dialogue_resource, dialogue_start)
