event_inherited();

#region Установка параметров физики
var fix = physics_fixture_create();
physics_fixture_set_circle_shape(fix, 8);
physics_fixture_set_density(fix, 5);
physics_fixture_set_friction(fix, 0.5);
physics_fixture_set_restitution(fix, 0.2);
physics_fixture_set_linear_damping(fix, 0.5);
physics_fixture_set_angular_damping(fix, 0.1);
physics_fixture_set_collision_group(fix, 1);

fixture = physics_fixture_bind(fix, id);
densityDefault = physics_get_density(fixture);

physics_fixture_delete(fix);
phy_fixed_rotation = false;
#endregion