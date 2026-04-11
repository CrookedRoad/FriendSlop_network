function scr_part_healingFX_init(){
    global.pt_healingFX = part_type_create();
    var pt = global.pt_healingFX;
    
    part_type_sprite(pt,s_heal_part,0,0,0);
    part_type_colour2(pt,c_white, c_lime);
    part_type_alpha3(pt,0,0.8,0);

    part_type_direction(pt,90,90,0,0);
    part_type_speed(pt,0.5,1,-0.002,0);
    part_type_size(pt,0.5,0.8,0.002,0);
    part_type_life(pt,30,60);
}