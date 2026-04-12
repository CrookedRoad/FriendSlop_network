function scr_char_crumbling(){ 
var shard = instance_create_depth(x, y, depth, o_skull);
	with(shard){
		phy_rotation = other.phy_rotation;
		physics_apply_impulse(x, y, choose(-10, 10), -irandom_range(30, 50));
	}
var shard = instance_create_depth(x, y, depth, o_ribs);
	with(shard){
		phy_rotation = other.phy_rotation;
		physics_apply_impulse(x, y, choose(-10, 10), -irandom_range(30, 50));
	}
	repeat(4)
	{
	var shard = instance_create_depth(x, y, depth, o_limb);
		with(shard){
			phy_rotation = irandom(360);
			physics_apply_impulse(x, y, choose(-10, 10), -irandom_range(10, 30));
		}
	}

var emitter = scr_create_partEmitter(x, y, depth-3, 120);
	if emitter != 0 && instance_exists(emitter){
	with(emitter){
		if part_system_exists(p_sys){
		repeat(15){
		var a = irandom(360);
		var l = irandom(30);
		var xx, yy;
			xx = x + lengthdir_x(l, a);
			yy = y + lengthdir_y(l, a);
			part_particles_create(p_sys, xx, yy, global.pt_smoke, 1);
		}
		}
	}
	}
}