#region Установка параметров физики
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
#endregion
depth = 1;

ownerSteam_id = steam_get_user_steam_id();
maxhp = 3;
HP = maxhp;
spawnX = x;
spawnY = y;

headSprite = s_charHead;
bodySprite = s_charBody;
legSprite = s_charLeg;
armSprite = s_charArm;

running = false;
moving = false;
climbing = false;
pushing = false;
move_force = 1000;
walk_speed = 1;
run_speed = 2;
current_max_speed = walk_speed;
jump_force = -130;

posX = x;
posY = y;
posX_prev = x;
posY_prev = y;

armDirection = 0;
armAngle = 20;
legAngle = 0;
legOffset = 0;
bodyOffset = 0;
bodyAngle = 0;
bodySpring = 0;
bodySpring_draw = 0;
breath = 0;

if instance_exists(o_viewController){
if object_index == o_player{
	o_viewController.viewFollowTarget = id;
}
} else{
	instance_create_depth(0, 0, 0, o_viewController);
}