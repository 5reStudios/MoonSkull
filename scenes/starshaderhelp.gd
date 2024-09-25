extends ColorRect

@export var star_material : ShaderMaterial

func _ready():
	if star_material:
		self.material = star_material

func _process(delta):
	if star_material:
		star_material.set_shader_parameter("time", Time.get_ticks_msec() / 1000.0)
