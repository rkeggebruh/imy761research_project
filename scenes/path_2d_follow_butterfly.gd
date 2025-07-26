extends PathFollow2D

var previous_position: Vector2
var speed = 0.5

func _ready():
	previous_position = global_position

func _process(delta):
	#progress_ratio += delta + speed
	progress_ratio += delta * speed
	
	var current_position = global_position
	var movement_direction = current_position - previous_position
	previous_position = current_position
	
	#if movement_direction.x > 0:
		#$butterflyHelper.scale.x = -0.5  # Flip vertically
	#elif movement_direction.x < 0:
		#$butterflyHelper.scale.x = 0.5   # Reset to original scale
