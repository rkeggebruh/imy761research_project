extends CharacterBody2D

const SPEED = 300.0

@onready var actionable_finder: Area2D = $direction/ActionableFinder

func _getInput():
	if State.is_in_dialog:
		velocity = Vector2.ZERO
		$AnimatedSprite2D.play("idle")
	else:
		var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
		velocity = direction * SPEED
		if direction.x < 0:
			$AnimatedSprite2D.play("walk_left")
			$Path2D/path2dFollowButterfly/butterflyHelper.flip_h = false
		elif direction.x > 0:
			$AnimatedSprite2D.play("walk_right")
			$Path2D/path2dFollowButterfly/butterflyHelper.flip_h = true
		elif direction.y < 0:
			$AnimatedSprite2D.play("walk_back")
		elif direction.y > 0:
			$AnimatedSprite2D.play("walk_front")
		else:
			$AnimatedSprite2D.play("idle")

func _physics_process(delta):
	_getInput()
	move_and_slide()


func _unhandled_input(_event) -> void:
	#if not State.is_in_dialog:
	if Input.is_action_just_pressed("ui_accept"):
		var actionables = actionable_finder.get_overlapping_areas()
		if actionables.size() > 0:
			actionables[0]._action()
			return
