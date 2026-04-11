///@function 
function scr_part_sparkFX_init(){
    global.pt_sparkFX = part_type_create();
    var pt = global.pt_sparkFX;
    
    part_type_sprite(pt,s_sparkle_part,1,true,0);
    part_type_orientation(pt,0,0,0,0,0);
    part_type_colour2(pt,c_yellow, c_white);

    part_type_size(pt,0.1,0.2,0,0);
    part_type_life(pt,30,60);
}