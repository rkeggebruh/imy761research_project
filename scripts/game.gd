extends Node2D



#func _on_ready() -> void:
	#$input.hide()

func _process(_delta):
	$inputTV.position.x = $environmental_objects/Cappy.position.x
	$inputTV.position.y = $environmental_objects/Cappy.position.y
	
	$inputTvOff_T_L_I.position.x = $environmental_objects/Cappy.position.x
	$inputTvOff_T_L_I.position.y = $environmental_objects/Cappy.position.y
	
	$input_LampOn.position.x = $environmental_objects/Cappy.position.x
	$input_LampOn.position.y = $environmental_objects/Cappy.position.y
	
	$input_LampOff.position.x = $environmental_objects/Cappy.position.x
	$input_LampOff.position.y = $environmental_objects/Cappy.position.y
