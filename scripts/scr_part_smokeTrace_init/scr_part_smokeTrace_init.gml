///@function 
function scr_part_smokeTrace_init(){
    global.pt_smokeTrace = part_type_create();
    var pt = global.pt_smokeTrace;
    
    part_type_sprite(pt,s_smoke_part,0,0,3);
    part_type_orientation(pt,0,360,random_range(-1,1),0,0);
    
    part_type_alpha3(pt,0.5,0.8,1);
    part_type_size(pt,0.8,1.5,-0.01,0);
    part_type_life(pt,60,120);
}