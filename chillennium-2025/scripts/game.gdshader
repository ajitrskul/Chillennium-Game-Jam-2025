shader_type canvas_item;

uniform vec2 light_position;  // Position of the light source
uniform float blocking_angle = 90.0;  // Angle at which the light is blocked

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
    vec2 to_light = light_position - FRAGCOORD.xy;
    float angle = atan(to_light.y, to_light.x);
    
    // Block light only if the angle difference is less than the blocking angle
    if (abs(angle) < blocking_angle) {
        discard;  // Make the pixel transparent (block light)
    }

    COLOR = texture(TEXTURE, UV);  // Default appearance of the tile
}

//void light() {
	// Called for every pixel for every light affecting the CanvasItem.
	// Uncomment to replace the default light processing function with this one.
//}
