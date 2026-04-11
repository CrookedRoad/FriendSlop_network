///@function 
function scr_part_smokeUP_init(){
    global.pt_smokeUP = part_type_create();
    var pt = global.pt_smokeUP;
    
    part_type_sprite(pt,s_smoke_part,0,0,3);
    part_type_orientation(pt,0,360,random_range(-1,1),0,0);
    
    part_type_size(pt,0.8,1.5,-0.01,0);
    part_type_alpha2(pt,0.5,0);
    part_type_speed(pt,0.05,1,-0.01,0);
    part_type_direction(pt,85,95,random_range(-2,2),0);
    
    part_type_life(pt,60,120);
}