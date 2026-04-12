depth = 1;
ownerSteam_id = global.steamID;

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
walljump_force = 150;

lerpSpeed = 0.5;
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