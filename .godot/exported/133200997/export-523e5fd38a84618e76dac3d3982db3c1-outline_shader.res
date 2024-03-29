RSRC                    VisualShader            ��������                                            A      resource_local_to_scene    resource_name    output_port_for_preview    default_input_values    expanded_output_ports 	   constant    script    parameter_name 
   qualifier    default_value_enabled    default_value 	   operator    code    graph_offset    mode    modes/blend    modes/depth_draw    modes/cull    modes/diffuse    modes/specular    flags/depth_prepass_alpha    flags/depth_test_disabled    flags/sss_mode_skin    flags/unshaded    flags/wireframe    flags/skip_vertex_transform    flags/world_vertex_coords    flags/ensure_correct_normals    flags/shadows_disabled    flags/ambient_light_disabled    flags/shadow_to_opacity    flags/vertex_lighting    flags/particle_trails    flags/alpha_to_coverage     flags/alpha_to_coverage_and_one    flags/debug_shadow_splits    flags/fog_disabled    nodes/vertex/0/position    nodes/vertex/connections    nodes/fragment/0/position    nodes/fragment/2/node    nodes/fragment/2/position    nodes/fragment/3/node    nodes/fragment/3/position    nodes/fragment/4/node    nodes/fragment/4/position    nodes/fragment/5/node    nodes/fragment/5/position    nodes/fragment/connections    nodes/light/0/position    nodes/light/connections    nodes/start/0/position    nodes/start/connections    nodes/process/0/position    nodes/process/connections    nodes/collide/0/position    nodes/collide/connections    nodes/start_custom/0/position    nodes/start_custom/connections     nodes/process_custom/0/position !   nodes/process_custom/connections    nodes/sky/0/position    nodes/sky/connections    nodes/fog/0/position    nodes/fog/connections        ,   local://VisualShaderNodeColorConstant_mqcg1 �      -   local://VisualShaderNodeColorParameter_kvn47 4      /   local://VisualShaderNodeLinearSceneDepth_d3ao7 �      &   local://VisualShaderNodeFloatOp_pyrux �         local://VisualShader_hf1y4 '	         VisualShaderNodeColorConstant                        �?         VisualShaderNodeColorParameter             ColorParameter 	         
                    �?      !   VisualShaderNodeLinearSceneDepth             VisualShaderNodeFloatOp                                      �?         VisualShader          u  shader_type spatial;
render_mode blend_mix, depth_draw_opaque, cull_back, diffuse_lambert, specular_schlick_ggx;

uniform vec4 ColorParameter : source_color = vec4(0.000000, 0.000000, 0.000000, 1.000000);
uniform sampler2D depth_tex_frg_4 : hint_depth_texture;



void fragment() {
// ColorConstant:2
	vec4 n_out2p0 = vec4(0.000000, 0.000000, 0.000000, 1.000000);


// ColorParameter:3
	vec4 n_out3p0 = ColorParameter;


	float n_out4p0;
// LinearSceneDepth:4
	{
		float __log_depth = textureLod(depth_tex_frg_4, SCREEN_UV, 0.0).x;
	vec4 __depth_view = INV_PROJECTION_MATRIX * vec4(SCREEN_UV * 2.0 - 1.0, __log_depth, 1.0);
		__depth_view.xyz /= __depth_view.w;
		n_out4p0 = -__depth_view.z;
	}


// FloatOp:5
	float n_in5p1 = 1.00000;
	float n_out5p0 = n_out4p0 + n_in5p1;


// Output:0
	ALBEDO = vec3(n_out2p0.xyz);
	EMISSION = vec3(n_out3p0.xyz);
	NORMAL_MAP_DEPTH = n_out5p0;


}
    
   �&�k�B'   
     �C  C(             )   
   �QcCxC*            +   
     �B  �C,            -   
         D.            /   
     �C  D0                                                                
         RSRC