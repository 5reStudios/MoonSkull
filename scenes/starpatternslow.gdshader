shader_type canvas_item;
uniform float speed = 0.001;
void vertex() {
	UV.x += TIME * speed;
	UV.y += TIME * speed;
}

uniform float flicker_intensity = 0.1; // Control the flicker strength
uniform float flicker_speed = 0.01; // Control the flicker speed
