///@function 
function scr_part_shard_init_global(argument0){
    global.pt_shrdGlob = part_type_create();
    var pt = global.pt_shrdGlob;
    var sprt = argument0;
    
    part_type_sprite(pt,sprt,0,0,sprite_get_number(sprt)-1);
    part_type_orientation(pt,0,360,1,0,0);
    part_type_size(pt,1,1,-0.025,0);
    part_type_speed(pt,3,5,-0.15,0);
    part_type_direction(pt,45,135,0,0);
    part_type_gravity(pt,0.2,270);
    part_type_life(pt,20,40);
}