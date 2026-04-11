///@function scr_part_bloodPart_init(color1, color2)
function scr_part_bloodPart_init(argument0, argument1){
    pt_bloodPart = part_type_create();
    var pt = pt_bloodPart;
    
    part_type_shape(pt,pt_shape_disk);
    part_type_size(pt,0.01,0.03,0,0);
    part_type_color_mix(pt,argument0, argument1);
    part_type_alpha3(pt,1,1,0);
    
    part_type_direction(pt,0,360,0,0);
    part_type_speed(pt,0.02,0.5,0,0);

    part_type_life(pt,10,20);
}