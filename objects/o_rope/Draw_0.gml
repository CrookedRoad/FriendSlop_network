if (instance_exists(parent_obj) && instance_exists(target_obj)) {
    var _px = parent_obj.x;
    var _py = parent_obj.y;
    
    for (var i = 0; i < ds_list_size(segments_list); i++) {
        var _seg = segments_list[| i];
        if (instance_exists(_seg)) {
            draw_line_width_color(_px, _py, _seg.x, _seg.y, 2, c_white, c_white);
            _px = _seg.x;
            _py = _seg.y;
        }
    }
    draw_line_width_color(_px, _py, target_obj.x, target_obj.y, 2, c_white, c_white);
}