extends Node2D

@onready var line_edit: LineEdit = $LineEdit
@onready var line_edit2: LineEdit = $LineEdit2
@onready var line_edit3: LineEdit = $LineEdit3


var enterOnce = false

func _ready():
	$".".hide()
	$"Excelente!".hide()
	
	line_edit.text_submitted.connect(_on_line_editText_entered)
	line_edit.focus_exited.connect(_on_line_edit_focus_exited)
	
	line_edit2.text_submitted.connect(_on_line_editText2_entered)
	line_edit2.focus_exited.connect(_on_line_edit2_focus_exited)
	
	line_edit3.text_submitted.connect(_on_line_editText3_entered)
	line_edit3.focus_exited.connect(_on_line_edit3_focus_exited)

func _process(_delta):
	if !enterOnce && State.boomBoxFillInLettersTimeOff:
		$".".show()
		State.is_in_dialog = true
		enterOnce = true
	
	if State.letterRadioLCorrectOff && State.letterRadioRCorrectOff && State.letterRadioOCorrectOff:
		State.boomBoxFillInLettersOffCorrect = true
		State.boomBoxFillInLettersTimeOff = false
		State.twiceRadio = true
		$"Excelente!".show()
		$AnimationPlayer.play("anim")
		$Line2D.hide()
		$Line2D2.hide()
		$LineEdit.hide()
		$LineEdit2.hide()
		$instruction.hide()
		$instruction3.hide()
		$LineEdit3.hide()
		$Line2D3.hide()

func _on_line_editText_entered(text: String) -> void:
	print("input for e, ", text)
	if State.boomBoxFillInLettersTimeOff && text == "e":
		State.letterRadioLCorrectOff = true

func _on_line_editText2_entered(text: String) -> void:
	print("input for c, ", text)
	if State.boomBoxFillInLettersTimeOff && text == "c":
		State.letterRadioRCorrectOff = true

func _on_line_editText3_entered(text: String) -> void:
	print("input for o, ", text)
	if State.boomBoxFillInLettersTimeOff && text == "o":
		State.letterRadioOCorrectOff = true

func _on_line_edit_focus_exited() -> void:
	_on_line_editText_entered(line_edit.text)

func _on_line_edit2_focus_exited() -> void:
	_on_line_editText2_entered(line_edit2.text)

func _on_line_edit3_focus_exited() -> void:
	_on_line_editText3_entered(line_edit3.text)

func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$".".hide()
	State.is_in_dialog = false
