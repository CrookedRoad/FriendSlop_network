function scr_part_stenchUP_init(){
    global.pt_stenchUP = part_type_create();
    var pt = global.pt_stenchUP;
    
    part_type_sprite(pt,s_fog_part,0,0,(sprite_get_number(s_fog_part)-1));
    part_type_orientation(pt,0,360,random_range(-0.2,0.2),0,0);
    part_type_colour1(pt,$9A6129); 
    
    part_type_alpha3(pt,0,1,0);
    part_type_size(pt,0.025,0.05,0.0005,0);
    part_type_life(pt,60,120);
    
    part_type_speed(pt,0.1,0.5,-0.005,0);
    part_type_direction(pt,85,95,0,0);
}