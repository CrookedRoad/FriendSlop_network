function scr_part_acidRain_init(){
    global.pt_acidRain = part_type_create();
    var pt = global.pt_acidRain;
    var col = merge_colour(c_gray,c_lime,0.7);
    
    var angle = 270;
    
    part_type_sprite(pt,s_rain_part,0,0,sprite_get_number(s_rain_part)-1);
    part_type_alpha3(pt,0.5,0.7,1);
    part_type_colour1(pt,col);
    part_type_orientation(pt,0,0,0,0,0);
    part_type_size(pt,1,1.5,-0.1,0);
    part_type_speed(pt,3,5,-0.15,0);
    part_type_direction(pt,angle,angle,0,0);
    part_type_gravity(pt,0.2,angle);
    part_type_life(pt,20,40);
}