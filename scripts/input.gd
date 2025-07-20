extends Node2D

@onready var line_edit: LineEdit = $LineEdit
@onready var label: Label = $Label

var enterOnce = false

func _ready():
	$".".hide()
	
	if State.inLamp:
		$instruction.text = State.lampInstructionInput
	
	line_edit.text_submitted.connect(_on_line_editText_entered)

func _process(_delta):
	if !enterOnce && State.inLamp:
		#$".".show()
		enterOnce = true

func _on_line_editText_entered(text: String) -> void:
	label.text  = "Answer: " + text
