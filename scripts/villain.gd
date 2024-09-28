extends CharacterBody2D


const SPEED = 100.0
var movingRight = 1
var canSwitch = true
func _physics_process(delta: float) -> void:
	if !$RayCast2D.is_colliding() and canSwitch:
		movingRight = 1
		canSwitch = false
	else:
		canSwitch =true
	
	
	
	if movingRight <0:
		velocity.x = SPEED * -1
		$RayCast2D.target_position = Vector2(-270,250)
	else:
		velocity.x = SPEED * 1.0
		$RayCast2D.target_position = Vector2(270,250)
		move_and_slide()
	if velocity.x > 0:
		$AnimatedSprite2D.animation = "skullwalking"
