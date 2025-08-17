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
		State.lampFillInLettersTimeOn = false
		State.lampFillInLettersOnCorrect = true
		$"Excelente!".show()
		$AnimationPlayerlampOn.play("anim")
		State.lampTurnOff = true
		$Line2D.hide()
		$Line2D2.hide()
		$LineEdit.hide()
		$LineEdit2.hide()
		$instruction.hide()
		$instruction2.hide()

func _on_line_editText_entered(text: String) -> void:
	if State.lampFillInLettersTimeOn && text == "l":
		State.letterLampLCorrect = true

func _on_line_editText2_entered(text: String) -> void:
	if State.lampFillInLettersTimeOn && text == "a":
		State.letterLampACorrect = true

func _on_line_edit_focus_exited() -> void:
	_on_line_editText_entered(line_edit.text)

func _on_line_edit2_focus_exited() -> void:
	_on_line_editText2_entered(line_edit2.text)


func _on_animation_playerlamp_on_animation_finished(anim_name: StringName) -> void:
	$".".hide()
	$AnimationPlayerlampOn.stop()
	print("switching dialogue to false---")
	State.is_in_dialog = false
	
	$AnimationPlayerlampOn.disconnect("animation_finished", Callable(self, "_on_animation_playerlamp_on_animation_finished"))
