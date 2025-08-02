extends Node2D

@onready var line_edit: LineEdit = $LineEdit
@onready var line_edit2: LineEdit = $LineEdit2

var enterOnce = false

func _ready():
	$".".hide()
	$"Excelente!".hide()
	
	line_edit.text_submitted.connect(_on_line_editText_entered)
	line_edit2.text_submitted.connect(_on_line_editText2_entered)
	line_edit.focus_exited.connect(_on_line_edit_focus_exited)
	line_edit2.focus_exited.connect(_on_line_edit2_focus_exited)

func _process(_delta):
	if !enterOnce && State.lampFillInLettersTimeOn:
		$".".show()
		State.is_in_dialog = true
		enterOnce = true
	
	if State.letterLampLCorrect && State.letterLampACorrect:
		State.lampFillInLettersOnCorrect = true
		$"Excelente!".show()
		$AnimationPlayer.play("anim")
		$Line2D.hide()
		$Line2D2.hide()
		$LineEdit.hide()
		$LineEdit2.hide()
		$instruction.hide()
		$instruction2.hide()

func _on_line_editText_entered(text: String) -> void:
	if State.lampFillInLettersTimeOn && text == "l":
		#print("the letter l is correct--------------- ")
		State.letterLampLCorrect = true

func _on_line_editText2_entered(text: String) -> void:
	if State.lampFillInLettersTimeOn && text == "a":
		#print("the letter p is correct-------------- ")
		State.letterLampACorrect = true

func _on_line_edit_focus_exited() -> void:
	_on_line_editText_entered(line_edit.text)

func _on_line_edit2_focus_exited() -> void:
	_on_line_editText2_entered(line_edit2.text)
