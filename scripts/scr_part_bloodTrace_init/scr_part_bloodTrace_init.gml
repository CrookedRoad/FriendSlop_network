///@function scr_part_bloodTrace_init(color1, color2)
function scr_part_bloodTrace_init(argument0, argument1){
    pt_bloodTrace = part_type_create();
    var pt = pt_bloodTrace;
    
    part_type_shape(pt,pt_shape_disk);
    part_type_size(pt,0.03,0.06,-0.0015,0);
    part_type_color_mix(pt,argument0, argument1);
    part_type_alpha3(pt,1,1,0);

    part_type_life(pt,30,60);
}