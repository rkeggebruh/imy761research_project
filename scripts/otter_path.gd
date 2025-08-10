extends PathFollow2D

var previous_position: Vector2
var speed = 0.09

func _ready():
	previous_position = global_position

func _process(delta):
	speed = State.otterSpeed
	progress_ratio += delta * speed
	
	var current_position = global_position
	var movement_direction = current_position - previous_position
	previous_position = current_position
	
	State.otterMoving = true
	
	if movement_direction.x > 0:
		$mrs_otter.scale.x = -1  # Flip vertically
	elif movement_direction.x < 0:
		$mrs_otter.scale.x = 1   # Reset to original scale
