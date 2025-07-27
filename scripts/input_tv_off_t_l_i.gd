extends Node2D

@onready var line_edit: LineEdit = $LineEdit
@onready var line_edit2: LineEdit = $LineEdit2
@onready var line_edit3: LineEdit = $LineEdit3
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
	line_edit3.text_submitted.connect(_on_line_editText3_entered)
	line_edit.focus_exited.connect(_on_line_edit_focus_exited)
	line_edit2.focus_exited.connect(_on_line_edit2_focus_exited)
	line_edit3.focus_exited.connect(_on_line_edit3_focus_exited)

func _process(_delta):
	if !enterOnce && State.FillInTVLetterTimeTVOFF:
		$".".show()
		State.is_in_dialog = true
		enterOnce = true
	
	if State.letterTTVCorrectOff && State.letterTTVCorrectOff && State.letterITVCorrectOff:
		State.TVFillInLettersCorrect = true
		$"Excelente!".show()
		$AnimationPlayer.play("anim")
		$Line2D.hide()
		$Line2D2.hide()
		$Label.hide()
		$Label2.hide()
		$Line2D3.hide()
		$LineEdit.hide()
		$LineEdit2.hide()
		$instruction.hide()
		$instruction2.hide()
		#$".".hide()
		#State.is_in_dialog = false

func _on_line_editText_entered(text: String) -> void:
	label.text  = "Answer: " + text
	
	if State.FillInTVLetterTimeTVOFF && text == "t":
		label.text = "Correcto! " + text
		State.letterTTVCorrectOff = true


func _on_line_editText2_entered(text: String) -> void:
	label2.text  = "Answer: " + text
	
	if State.FillInTVLetterTimeTVOFF && text == "l":
		label2.text = "Excelente! " + text
		State.letterLTVCorrectOff = true

func _on_line_editText3_entered(text: String) -> void:
	label2.text  = "Answer: " + text
	
	if State.FillInTVLetterTimeTVOFF && text == "i":
		label2.text = "Excelente! " + text
		State.letterITVCorrectOff = true

func _on_line_edit_focus_exited() -> void:
	_on_line_editText_entered(line_edit.text)

func _on_line_edit2_focus_exited() -> void:
	_on_line_editText2_entered(line_edit2.text)

func _on_line_edit3_focus_exited() -> void:
	_on_line_editText3_entered(line_edit2.text)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$".".hide()
	State.is_in_dialog = false
