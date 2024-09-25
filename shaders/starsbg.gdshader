shader_type canvas_item;

uniform vec3 starColor : source_color = vec3(1.0, 1.0, 0.8);
uniform float starDensity = 0.0005;
uniform float starSize = 2.0;      

float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void fragment() {
    // Fix for Godot 4.1+:
    vec2 screenSize = vec2(textureSize(0, 0)); // Use 0 for the texture type

    vec2 st = FRAGCOORD.xy / screenSize; 

    vec2 grid = floor(st * (1.0 / starDensity));
    float noise = rand(grid); 

    vec2 starPos = (grid + vec2(0.5)) * starDensity;
    float dist = distance(st, starPos);

    float starGlow = smoothstep(starSize * noise, starSize * 0.5 * noise, dist);

    COLOR = vec4(starColor * starGlow, 1.0); 
}