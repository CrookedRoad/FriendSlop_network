function scr_part_electric_init(){
    global.pt_electric = part_type_create();
    var pt = global.pt_electric;
    
    part_type_sprite(pt,s_electric_part,1,0,0);
    part_type_orientation(pt,0,360,random_range(-1,1),0,0);
    
    part_type_size(pt,0.5,1,-0.01,0);
    part_type_life(pt,30,90);
    
    part_type_speed(pt,0.05,1,-0.01,0);
    part_type_direction(pt,0,360,0,0);
}