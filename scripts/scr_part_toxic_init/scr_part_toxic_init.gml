///@function 
function scr_part_toxic_init(){
    global.pt_toxic = part_type_create();
    var pt = global.pt_toxic;
    
    part_type_sprite(pt,s_toxic_part,0,0,sprite_get_number(s_toxic_part)-1);
    part_type_orientation(pt,0,360,random_range(-1,1),0,0);
    
    part_type_size(pt,0.5,1,-0.01,0);
    part_type_alpha3(pt,0,0.8,0);
    part_type_speed(pt,0.05,1,-0.01,0);
    part_type_direction(pt,45,135,-0.1,0);
    
    part_type_life(pt,60,120);
}