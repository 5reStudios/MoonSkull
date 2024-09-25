shader_type canvas_item;

uniform float starDensity = 0.01;   // Density of stars (higher = more stars)
uniform float twinkleSpeed = 2.0;  // Speed of the twinkling effect
uniform float twinkleAmount = 0.3;  // Intensity of the twinkling
uniform float time; 

float rand(vec2 co){
    return fract(sin(dot(co.xy ,vec2(12.9898,78.233))) * 43758.5453);
}

void fragment() {
    vec2 st = UV;
    
    // Calculate a grid for star placement
    vec2 gridPos = floor(st * starDensity);
    float starSeed = rand(gridPos + vec2(time * 0.1));// Slightly offset for variation
    
    // Make some stars appear in slightly different positions
    vec2 offset = vec2(rand(gridPos), rand(gridPos * 2.7));
    st += offset * (1.0 / starDensity) * 0.2;
    
    // Calculate distance to the center of each grid cell (potential star location)
    vec2 toCenter = vec2(0.5) - fract(st * starDensity); 
    float dist = length(toCenter);
    
    // Create a smooth falloff for star brightness based on distance 
    float starGlow = smoothstep(0.4, 0.0, dist); 
    
    // Twinkling effect using sine wave
    float twinkle = sin((starSeed + Time.time * twinkleSpeed)) * 0.5 + 0.5;
    starGlow *= twinkle * twinkleAmount + (1.0 - twinkleAmount);

    COLOR = vec4(vec3(starGlow), 1.0); // White stars
}