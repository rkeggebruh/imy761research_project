extends Node2D


var enterOnce = false
var enterOnceCouch = false

var enterOnceSecondIns = false

var second = false

func _on_ready() -> void:
	$cappy_sleeping.hide()

func _process(_delta):
	$inputTV.position.x = $environmental_objects/Cappy.position.x
	$inputTV.position.y = $environmental_objects/Cappy.position.y
	
	$inputTvOff_T_L_I.position.x = $environmental_objects/Cappy.position.x
	$inputTvOff_T_L_I.position.y = $environmental_objects/Cappy.position.y
	
	$input_LampOn.position.x = $environmental_objects/Cappy.position.x
	$input_LampOn.position.y = $environmental_objects/Cappy.position.y
	
	$input_LampOff.position.x = $environmental_objects/Cappy.position.x
	$input_LampOff.position.y = $environmental_objects/Cappy.position.y
	
	$input_boomBox_On.position.x = $environmental_objects/Cappy.position.x
	$input_boomBox_On.position.y = $environmental_objects/Cappy.position.y
	
	$input_boomBox_Off.position.x = $environmental_objects/Cappy.position.x
	$input_boomBox_Off.position.y = $environmental_objects/Cappy.position.y
	
	$input_couchR_sleep.position.x = $environmental_objects/Cappy.position.x
	$input_couchR_sleep.position.y = $environmental_objects/Cappy.position.y
	
	$game_instructions.position.x = $environmental_objects/Cappy.position.x
	$game_instructions.position.y = $environmental_objects/Cappy.position.y
	
	$input_perchero1.position.x = $environmental_objects/Cappy.position.x
	$input_perchero1.position.y = $environmental_objects/Cappy.position.y
	
	$input_couch_off.position.x = $environmental_objects/Cappy.position.x
	$input_couch_off.position.y = $environmental_objects/Cappy.position.y
	
	$input_perchero_off.position.x = $environmental_objects/Cappy.position.x
	$input_perchero_off.position.y = $environmental_objects/Cappy.position.y
	
	
	if (State.boomBoxFillInLettersOnCorrect && !enterOnce):
		enterOnce = true
		State.radioOn = true
		#$mainGameSoundtrack.stop()
		#$radioOn.play()
	
	if (State.boomBoxFillInLettersOffCorrect && enterOnce):
		enterOnce = false
		State.radioOn = false
		#$mainGameSoundtrack.play()
		#$radioOn.stop()
	
	if (State.CRFillInLettersTimeSleepCorrect && !enterOnceCouch):
		enterOnceCouch = true
		print("x")
		$cappy_sleeping.show()
		State.is_in_dialog = true
		State.cappySleeping = true
		State.CRFillInLettersTimeSleepCorrect = false
		$environmental_objects/Cappy.hide()
	
	if State.cappySleeping && Input.is_action_just_pressed("ui_accept"):
		print("sleeeeeeeeeeeeping and now wake up ")
		$cappy_sleeping.hide()
		State.is_in_dialog = false
		State.cappySleeping = false
		$environmental_objects/Cappy.show()
	
	#if State.instructionsShowing && !enterOnceSecondIns && Input.is_action_just_released("ui_accept"):
		#print("show second instructions")
		#State.showSecondInstruction = true
		#enterOnceSecondIns = true
	#
	#if State.showSecondInstruction && State.instructionsShowing && Input.is_action_just_released("ui_accept"):
		#print("hiiiiiiiiiiide instructions")
		#State.instructionsShowing = false
		#State.hideInstructions = true
	
	if State.instructionsShowing && !enterOnceSecondIns && Input.is_action_just_released("ui_accept"):
		print("show second instructions")
		State.showSecondInstruction = true
		enterOnceSecondIns = true
	elif State.showSecondInstruction && State.instructionsShowing && Input.is_action_just_released("ui_accept"):
		print("hiiiiiiiiiiide instructions")
		State.instructionsShowing = false
		State.hideInstructions = true
