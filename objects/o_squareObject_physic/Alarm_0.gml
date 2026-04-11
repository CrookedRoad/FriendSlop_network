/// @description Установка параметров физики
var fix = physics_fixture_create();
physics_fixture_set_box_shape(fix, phy_shape_w, phy_shape_h);
physics_fixture_set_density(fix, phy_density);
physics_fixture_set_friction(fix, phy_friction);
physics_fixture_set_restitution(fix, phy_restitution);
physics_fixture_set_linear_damping(fix, 0.5);
physics_fixture_set_angular_damping(fix, 0.1);
physics_fixture_set_collision_group(fix, phy_collision_group);

physics_fixture_bind(fix, id);

physics_fixture_delete(fix);
phy_fixed_rotation = false;