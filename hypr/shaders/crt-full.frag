#version 300 es
precision mediump float;

in vec2 v_texcoord;
uniform sampler2D tex;

out vec4 fragColor;

void main() {
	vec2 uv = v_texcoord;

	// --- 1. Barrel Distortion ---
	vec2 center = uv - 0.5;
	float radius = dot(center, center); // r^2
	// Barrel factor (increase the last number for more curvature)
	uv = 0.5 + center * (1.0 + radius * 0.05);

	// --- 2. Sample texture ---
	vec4 color = texture(tex, uv);

	// --- 3. RGB Subpixel Mask (classic CRT look) ---
	// Create a horizontal RGB pattern
	float mask = fract(gl_FragCoord.x / 3.0);
	vec3 rgbMask = vec3(
		step(0.66, mask),		// Red when mask >= 0.66
		step(0.33, mask) * step(mask, 0.66), // Green in middle
		step(mask, 0.33)		// Blue when mask <= 0.33
	);
	// increase the last number for more tint.
	color.rgb *= mix(vec3(1.0), rgbMask * 1.5, 0.5);

	// --- 4. Scanlines ---
	color.rgb *= 0.9 + 0.1 * sin(gl_FragCoord.y * 1.5);

	// --- 5. Vignette (darken edges) ---
	// Increase the last number for darker edges.
	float vignette = smoothstep(0.8, 0.2, length(center) * 0.5);
	color.rgb *= vignette;

	// --- 6. Edge Cutoff ---
	float inside = step(0.0, uv.x) * step(0.0, uv.y) * step(uv.x, 1.0) * step(uv.y, 1.0);
	color *= inside;

	fragColor = color;
}

