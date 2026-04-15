if (ds_exists(joints_list, ds_type_list)) {
    for (var i = 0; i < ds_list_size(joints_list); i++) {
        var _joint = joints_list[| i];
        physics_joint_delete(_joint);
    }
    ds_list_destroy(joints_list);
}

if (ds_exists(segments_list, ds_type_list)) {
    for (var i = 0; i < ds_list_size(segments_list); i++) {
        var _seg = segments_list[| i];
        if (instance_exists(_seg)) {
            instance_destroy(_seg);
        }
    }
    ds_list_destroy(segments_list);
}