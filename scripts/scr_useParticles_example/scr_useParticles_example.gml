function scr_useParticles_example(){
// Использование через эмиттер
var emitter = scr_create_partEmitter(x, y-30, -y-10, 120);
	if emitter != 0 && instance_exists(emitter){
	with(emitter){
		if part_system_exists(p_sys){
			part_particles_create(p_sys, x, y, global.pt_smokeUP, 1);
		}
	}
	}
	
//Стандартное использование
var xx, yy;
	xx = (x+8)+irandom_range(-5,5);
	yy = (y+8)+irandom_range(-5,5);
	part_particles_create(global.ps, xx, yy, global.pt_sparkFX, 1);
}