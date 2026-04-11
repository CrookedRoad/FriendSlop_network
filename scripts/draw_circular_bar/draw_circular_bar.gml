/// @description  draw_circular_bar(x ,y ,value, max, colour, radius, transparency, width)
/// @param x 
/// @param y 
/// @param value
/// @param  max
/// @param  colour
/// @param  radius
/// @param  transparency
/// @param  width
function draw_circular_bar(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7){
	if (argument2 > 0) { // no point even running if there is nothing to display (also stops /0
	    var i, len, tx, ty, val;
	    var _radius = argument5;
	    var _width = argument7;
    
	    var numberofsections = 60 // there is no draw_get_circle_precision() else I would use that here
	    var sizeofsection = 360/numberofsections
    
	    val = (argument2/argument3) * numberofsections 
    
	    if (val > 1) { // HTML5 version doesnt like triangle with only 2 sides 
    
	        piesurface = surface_create(_radius*2,_radius*2)
            
	        draw_set_colour(argument4);
	        draw_set_alpha(argument6);
        
	        surface_set_target(piesurface)
        
	        draw_clear_alpha(c_blue,0.7)
	        draw_clear_alpha(c_black,0)
        
	        draw_primitive_begin(pr_trianglefan);
	        draw_vertex(_radius, _radius);
        
	        for(i=0; i<=val; i++) {
	            len = (i*sizeofsection)+90; // the 90 here is the starting angle
	            tx = lengthdir_x(_radius, len);
	            ty = lengthdir_y(_radius, len);
	            draw_vertex(_radius+tx, _radius+ty);
	        }
        
	        draw_primitive_end();
        
	        draw_set_alpha(1);
        
	        gpu_set_blendmode(bm_subtract)
	        draw_set_colour(c_black)
	        draw_circle(_radius-1, _radius-1,_radius-_width,false)
	        gpu_set_blendmode(bm_normal)

	        surface_reset_target()
     
	        draw_surface(piesurface,argument0-_radius, argument1-_radius)
        
	        surface_free(piesurface)
        
	    }
	}
}