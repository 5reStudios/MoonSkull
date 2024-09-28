extends Node2D

var positivity = 0
func _process(delta: float) -> void:
	$"GUI/positivity".text = str(positivity)
