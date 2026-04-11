function scr_part_fire_init(){
    global.pt_fire = part_type_create();
    var pt = global.pt_fire;
    
    part_type_sprite(pt,s_fire_part,0,0,sprite_get_number(s_fire_part)-1);
    part_type_orientation(pt,0,360,random_range(-1,1),0,0);
    
    part_type_alpha1(pt,1);
    part_type_size(pt,0.8,1,-0.02,0);
    part_type_speed(pt,0.2,0.6,-0.002,0);
    part_type_direction(pt,45,135,-0.1,0);
    part_type_gravity(pt,0,90);
    part_type_life(pt,60,120);
}