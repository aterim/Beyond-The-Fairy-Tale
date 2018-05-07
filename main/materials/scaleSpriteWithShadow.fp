// https://github.com/mattdesl/lwjgl-basics/wiki/ShaderLesson2

varying mediump vec4 var_position;
varying mediump vec2 var_texcoord0;

uniform lowp sampler2D DIFFUSE_TEXTURE;
uniform lowp vec4 tint;
uniform lowp vec4 camera_position;

const float RADIUS = 0.65;
const float SOFTNESS = 0.45;

void main()
{
	lowp vec4 tint_pm = vec4(tint.xyz * tint.w, tint.w);
	vec4 sum = texture2D(DIFFUSE_TEXTURE, var_texcoord0.xy);
	
	if (camera_position.z != 0.0)
	{
		vec2 position = ((var_position.xy - camera_position.xy) / (vec2(camera_position.z, camera_position.w)) );
	
		float len = length(position);
		
		float vignette = smoothstep(RADIUS, RADIUS - SOFTNESS, len);
		
		sum.rgb = mix(sum.rgb, sum.rgb * vignette, 0.75);
	}
	
 	gl_FragColor = sum * tint_pm;
}

