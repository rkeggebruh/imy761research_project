extends Node2D

@onready var line_edit: LineEdit = $LineEdit
@onready var line_edit2: LineEdit = $LineEdit2
@onready var label: Label = $Label
@onready var label2: Label = $Label2

var enterOnce = false

func _ready():
	State.is_in_dialog = true
	$".".hide()
	
	#if State.inLamp:
		#$instruction.text = State.lampInstructionInput
	
	line_edit.text_submitted.connect(_on_line_editText_entered)
	line_edit2.text_submitted.connect(_on_line_editText2_entered)

func _process(_delta):
	if !enterOnce && State.FillInTVLetterTime:
		$".".show()
		enterOnce = true
	
	if State.letterNTVCorrect && State.letterETVCorrect:
		State.TVFillInLettersCorrect = true
		State.is_in_dialog = false

func _on_line_editText_entered(text: String) -> void:
	label.text  = "Answer: " + text
	
	if State.FillInTVLetterTime && text == "e":
		label.text = "Correcto! " + text
		State.letterETVCorrect = true


func _on_line_editText2_entered(text: String) -> void:
	label2.text  = "Answer: " + text
	
	if State.FillInTVLetterTime && text == "n":
		label2.text = "Excelente! " + text
		State.letterNTVCorrect = true
