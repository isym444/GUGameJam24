RSRC                    Shader            ��������                                                  resource_local_to_scene    resource_name    code    script           local://Shader_mtrcw �          Shader          �  // NOTE: Shader automatically converted from Godot Engine 4.0.2.stable's StandardMaterial3D.

shader_type spatial;
render_mode blend_mix,depth_draw_never,cull_disabled,diffuse_burley,specular_schlick_ggx,ambient_light_disabled,alpha_to_coverage;
uniform float radius = 4;

uniform sampler2D texture_emission : source_color, hint_default_black,filter_linear_mipmap,repeat_enable;
uniform vec4 emission : source_color;
uniform float emission_energy;

uniform float alpha_scissor_threshold;
uniform float alpha_antialiasing_edge;

void vertex() {
	//UV=UV*uv1_scale.xy+uv1_offset.xy;
	
	vec4 model_pos_world = MODEL_MATRIX[3];
//	vec4 cam_origin_world = INV_VIEW_MATRIX[3];
	vec4 model_origin_cam_space = VIEW_MATRIX * model_pos_world;
	vec4 model_origin_proj_space = PROJECTION_MATRIX * VIEW_MATRIX * model_pos_world;
	model_origin_proj_space /= model_origin_proj_space.w;
	vec4 offset_proj_space = model_origin_proj_space + vec4(0.0, radius / VIEWPORT_SIZE.y, 0.0, 0.0);
	vec4 offset_cam_space = INV_PROJECTION_MATRIX * offset_proj_space;
	offset_cam_space /= offset_cam_space.w;

	vec4 radius_offset_cam_space = offset_cam_space - model_origin_cam_space;

//	float scale = length(model_origin_cam_space.xyz) * radius * 5.0 / VIEWPORT_SIZE.y;
	float scale = length(radius_offset_cam_space.xy) * 10.0;
	
	mat4 SCALE = mat4(vec4(scale, 0.0, 0.0, 0.0), 
		vec4(0.0, scale, 0.0, 0.0), 
		vec4(0.0, 0.0, scale, 0.0), 
		vec4(0.0, 0.0, 0.0, 1.0));
	
	MODELVIEW_MATRIX = VIEW_MATRIX * mat4(INV_VIEW_MATRIX[0], INV_VIEW_MATRIX[1], INV_VIEW_MATRIX[2], MODEL_MATRIX[3]) * SCALE;
	
	MODELVIEW_NORMAL_MATRIX = mat3(MODELVIEW_MATRIX);
}



void fragment() {
	vec2 base_uv = UV;
	vec4 emission_tex = texture(texture_emission, base_uv);
	emission_tex *= COLOR * emission;
	
	ALBEDO = vec3(0.0, 0.0, 0.0);
	EMISSION = emission_tex.xyz;
	
	ALPHA = emission_tex.a;
	ALPHA_SCISSOR_THRESHOLD = alpha_scissor_threshold;
	ALPHA_ANTIALIASING_EDGE = alpha_antialiasing_edge;
	ALPHA_TEXTURE_COORDINATE = UV;
}

       RSRC