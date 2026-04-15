if (parent_obj == noone || target_obj == noone) exit;
var _last_fixture = parent_obj;

var _dir = point_direction(parent_obj.x, parent_obj.y, target_obj.x, target_obj.y);
for (var i = 0; i < segment_count; i++) {
    // 1. Создаем сегмент со смещением
    var _sx = parent_obj.x + lengthdir_x(segment_dist * (i + 1), _dir);
    var _sy = parent_obj.y + lengthdir_y(segment_dist * (i + 1), _dir);
    var _inst = instance_create_depth(_sx, _sy, 0, o_ropeSegment);
    ds_list_add(segments_list, _inst);
    
    var _j = physics_joint_rope_create(_last_fixture, _inst, _last_fixture.x, _last_fixture.y, _inst.x, _inst.y, segment_dist, true);
    ds_list_add(joints_list, _j);
    
    _last_fixture = _inst;
}

var _j_final = physics_joint_rope_create(_last_fixture, target_obj, _last_fixture.x, _last_fixture.y, target_obj.x, target_obj.y, segment_dist, false);
ds_list_add(joints_list, _j_final);