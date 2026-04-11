function scr_part_fog_init(){
    global.pt_fog = part_type_create();
    var pt = global.pt_fog;
    
    part_type_sprite(pt,s_fog_part,0,0,(sprite_get_number(s_fog_part)-1));
    part_type_orientation(pt,0,360,random_range(-0.2,0.2),0,0);
    part_type_colour1(pt,c_white); 
    
    part_type_alpha3(pt,0,1,0);
    part_type_size(pt,0.3,0.5,0.0005,0);
    part_type_life(pt,120,300);
    
    part_type_speed(pt,0.1,1,-0.005,0);
    part_type_direction(pt,0,0,0,0);
}