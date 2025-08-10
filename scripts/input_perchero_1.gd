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
	if !enterOnce && State.coatRackFillInLettersTimeOn:
		$".".show()
		State.is_in_dialog = true
		enterOnce = true
	
	if State.lettercoatRackPCorrect && State.lettercoatRackRCorrect:
		State.coatRackFillInLettersOnCorrect = true
		$"Excelente!".show()
		$AnimationPlayer.play("anim")
		$Line2D.hide()
		$Line2D2.hide()
		$LineEdit.hide()
		$LineEdit2.hide()
		$instruction3.hide()
		$instruction.hide()

func _on_line_editText_entered(text: String) -> void:
	print("line for a, printed.. ", text)
	if State.coatRackFillInLettersTimeOn && text == "p":
		State.lettercoatRackPCorrect = true

func _on_line_editText2_entered(text: String) -> void:
	if State.coatRackFillInLettersTimeOn && text == "r":
		State.lettercoatRackRCorrect = true

func _on_line_edit_focus_exited() -> void:
	_on_line_editText_entered(line_edit.text)

func _on_line_edit2_focus_exited() -> void:
	_on_line_editText2_entered(line_edit2.text)


func _on_animation_player_animation_finished(anim_name: StringName) -> void:
	$".".hide()
	State.is_in_dialog = false
