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
	
	if State.letterLTVCorrectOff && State.letterTTVCorrectOff && State.letterITVCorrectOff:
		print("------------------ TV LETTERS OFF CORRECT")
		State.TVFillInLettersCorrectOff = true
		State.FillInTVLetterTimeTVOFF = false
		State.twiceTv = true
		$"Excelente!".show()
		$AnimationPlayer.play("anim")
		$Line2D.hide()
		$Line2D2.hide()
		$Label.hide()
		$Label2.hide()
		$Line2D3.hide()
		$LineEdit.hide()
		$LineEdit2.hide()
		$LineEdit3.hide()
		$instruction.hide()
		$instruction2.hide()
		#$".".hide()
		#State.is_in_dialog = false

func _on_line_editText_entered(text: String) -> void:
	label.text  = "Answer: " + text
	print("t input: ", text)
	
	if State.FillInTVLetterTimeTVOFF && text == "l":
		label.text = "Correcto! " + text
		print("------------------ T LETTERS OFF CORRECT")
		State.letterTTVCorrectOff = true


func _on_line_editText2_entered(text: String) -> void:
	label2.text  = "Answer: " + text
	print("l input: ", text)
	
	if State.FillInTVLetterTimeTVOFF && text == "m":
		label2.text = "Excelente! " + text
		print("------------------ L LETTERS OFF CORRECT")
		State.letterLTVCorrectOff = true

func _on_line_editText3_entered(text: String) -> void:
	label2.text  = "Answer: " + text
	print("i input: ", text)
	
	if State.FillInTVLetterTimeTVOFF && text == "a":
		label2.text = "Excelente! " + text
		print("------------------ I LETTERS OFF CORRECT")
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
	State.lampFirstInteraction = true
	State.lampTurnOff = false
