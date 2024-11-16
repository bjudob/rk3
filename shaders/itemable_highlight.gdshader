shader_type canvas_item;

uniform sampler2D SCREEN_TEXTURE :  hint_screen_texture, filter_linear_mipmap;
uniform float hit_opacity=0.5;
uniform sampler2D noise1 : repeat_enable;
uniform sampler2D noise2 : repeat_enable;
uniform sampler2D noise3 : repeat_enable;
uniform sampler2D noise4 : repeat_enable;
uniform sampler2D noise5 : repeat_enable;
uniform sampler2D noise6 : repeat_enable;
uniform sampler2D noise7 : repeat_enable;
uniform vec2 scroll1 = vec2(0.01, 0.1);
uniform vec2 scroll2 = vec2(-0.3, -0.3);
uniform vec2 scroll3 = vec2(-0.4, 0.05);
uniform vec2 scroll4 = vec2(0.05, 0.03);
uniform vec2 scroll5 = vec2(0.2, 0.25);
uniform vec2 scroll6 = vec2(0.2, 0.25);
uniform vec2 scroll7 = vec2(2.0, 0.25);

void fragment() {
	vec4 noise1_color = texture(noise1, UV + scroll1 * TIME);
	vec4 noise2_color = texture(noise2, UV + scroll2 * TIME);
	vec4 noise3_color = texture(noise3, UV + scroll3 * TIME);
	vec4 noise4_color = texture(noise4, UV + scroll4 * TIME);
	vec4 noise5_color = texture(noise4, UV + scroll5 * TIME);
	vec4 noise6_color = texture(noise4, UV + scroll6 * TIME);
	vec4 noise7_color = texture(noise4, UV + scroll7 * TIME);
	vec4 noise_color = (
		noise1_color 
		* noise2_color 
		* noise3_color 
		* noise4_color
		* noise5_color
		* noise6_color
		* noise7_color
		);
	vec4 screen_color = texture(SCREEN_TEXTURE, SCREEN_UV);
	
	noise_color = noise_color + vec4(0.3, 0.3, 0.3, 0);
	noise_color = noise_color;
	vec4 final_color = (noise_color * texture(TEXTURE, UV).rgba * 2.0);
	//vec4 final_color = (noise_color * texture(TEXTURE, UV).rgba * 7.0);
	//vec4 final_color = (noise_color * 0.5 + texture(TEXTURE, UV).rgba * 0.5);
	//final_color.a =  texture(TEXTURE, UV).a;
	COLOR = final_color;
}
