shader_type canvas_item;
render_mode unshaded;
uniform sampler2D gradient : hint_default_white;
uniform float color_offset : hint_range(-1.0, 1.0, 0.1) = 0.0;

void fragment() {
	vec4 input_color = texture(TEXTURE, UV);
	float value = (input_color.r + input_color.g + input_color.b) / 3.0;
	vec4 output_color = texture(gradient, vec2(value + color_offset, value));
	COLOR.rgb = output_color.rgb;
	COLOR.a *= output_color.a;
}
