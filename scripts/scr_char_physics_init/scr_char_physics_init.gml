function scr_char_physics_init(){
var fix = physics_fixture_create();
physics_fixture_set_box_shape(fix, 10, 14);
physics_fixture_set_density(fix, 5);
physics_fixture_set_friction(fix, 0.5);
physics_fixture_set_restitution(fix, 0.1);
physics_fixture_set_linear_damping(fix, 1);
physics_fixture_set_angular_damping(fix, 0.1);
physics_fixture_set_collision_group(fix, 1);

physics_fixture_bind(fix, id);

physics_fixture_delete(fix);
phy_fixed_rotation = false;
}