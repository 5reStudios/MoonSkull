extends Camera2D

@export var player: Node2D # Assign your player node here in the editor

@export var camera_limits: Rect2 # Set the bounds in the editor

func _process(delta):
	# Smooth camera follow
	var target_position = player.global_position
	global_position = global_position.lerp(target_position, 0.1)  # Adjust 0.1 for smoother/faster follow

	global_position.x = clamp(global_position.x, camera_limits.position.x, camera_limits.end.x) # Limit by Rect2
	global_position.y = clamp(global_position.y, camera_limits.position.y, camera_limits.end.y)
