extends Node2D

@onready var line_edit: LineEdit = $LineEdit
@onready var line_edit2: LineEdit = $LineEdit2
@onready var label: Label = $Label
@onready var label2: Label = $Label2

var enterOnce = false

func _ready():
	#State.is_in_dialog = true
	$".".hide()
	$"Excelente!".hide()
	
	#if State.inLamp:
		#$instruction.text = State.lampInstructionInput
	
	line_edit.text_submitted.connect(_on_line_editText_entered)
	line_edit2.text_submitted.connect(_on_line_editText2_entered)
	line_edit.focus_exited.connect(_on_line_edit_focus_exited)
	line_edit2.focus_exited.connect(_on_line_edit2_focus_exited)

func _process(_delta):
	if !enterOnce && State.FillInTVLetterTime:
		$".".show()
		State.is_in_dialog = true
		enterOnce = true
	
	if State.letterNTVCorrect && State.letterETVCorrect:
		State.TVFillInLettersCorrect = true
		State.FillInTVLetterTime = false
		$"Excelente!".show()
		$AnimationPlayer.play("anim")
		$Line2D.hide()
		$Line2D2.hide()
		$Label.hide()
		$Label2.hide()
		$LineEdit.hide()
		$LineEdit2.hide()
		$instruction.hide()
		$instruction2.hide()
		#$".".hide()
		#State.is_in_dialog = false

func _on_line_editText_entered(text: String) -> void:
	label.text  = "Answer: " + text
	
	if State.FillInTVLetterTime && text == "a":
		label.text = "Correcto! " + text
		State.letterETVCorrect = true


func _on_line_editText2_entered(text: String) -> void:
	label2.text  = "Answer: " + text
	
	if State.FillInTVLetterTime && text == "s":
		label2.text = "Excelente! " + text
		State.letterNTVCorrect = true
		State.FillInTVLetterTime = false


func _on_line_edit_focus_exited() -> void:
	_on_line_editText_entered(line_edit.text)

func _on_line_edit2_focus_exited() -> void:
	_on_line_editText2_entered(line_edit2.text)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$".".hide()
	State.is_in_dialog = false
