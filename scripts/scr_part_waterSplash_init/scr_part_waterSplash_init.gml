function scr_part_waterSplash_init(){
    global.pt_waterSplash = part_type_create();
    var pt = global.pt_waterSplash;
    var col = merge_colour(c_gray,c_aqua,0.7);

    part_type_shape(pt,pt_shape_disk);
    part_type_color1(pt,col);
    part_type_size(pt,0.01,0.02,0,0);
    part_type_speed(pt,0.5,1.5,-.1,0);
    part_type_direction(pt,45,135,0,0);
    part_type_gravity(pt,0.1,270);
    part_type_life(pt,5,15);
}