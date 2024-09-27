shader_type canvas_item;

uniform float flicker_intensity = 0.2; // Control the flicker strength
uniform float flicker_speed = 0.5; // Control the flicker speed

void fragment() {
    vec4 color = texture(TEXTURE, UV);
    float luminance = dot(color.rgb, vec3(0.299, 0.587, 0.114));

    // Add flicker based on time and noise
    float flicker = sin(TIME * flicker_speed) * flicker_intensity;
    luminance += flicker;

    COLOR = vec4(luminance, luminance, luminance, color.a);
}