/// @description Установка параметров физики
var fix = physics_fixture_create();
physics_fixture_set_circle_shape(fix, phy_shape_rad);
physics_fixture_set_density(fix, phy_density);
physics_fixture_set_friction(fix, phy_friction);
physics_fixture_set_restitution(fix, phy_restitution);
physics_fixture_set_linear_damping(fix, 0.5);
physics_fixture_set_angular_damping(fix, 0.1);
physics_fixture_set_collision_group(fix, phy_collision_group);

fixture = physics_fixture_bind(fix, id);
densityDefault = physics_get_density(fixture);

physics_fixture_delete(fix);
phy_fixed_rotation = false;
physics_init = true;