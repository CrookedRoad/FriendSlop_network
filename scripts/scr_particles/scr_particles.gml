function scr_particlesInit(){ //Для Create глобального контроллера
global.ps = part_system_create();
global.ps_dynamic = part_system_create();
global.ps_above = part_system_create();
global.ps_below = part_system_create();
part_system_depth(global.ps_above,-10);
part_system_depth(global.ps_below,10);
part_system_depth(global.ps,-room_height+1);

scr_part_shard_init_global(s_stone_part);

scr_part_smoke_init();
scr_part_smokeUP_init();
scr_part_smokeTrace_init();
scr_part_fire_init();
scr_part_electric_init();
scr_part_toxic_init();
scr_part_waterSplash_init();
scr_part_rain_init();
scr_part_sparkFX_init();
scr_part_healingFX_init();
scr_part_warmingFX_init();
scr_part_buffFX_init();
scr_part_acidRain_init();
scr_part_acidSplash_init();
scr_part_fog_init();
scr_part_stenchUP_init();
}

function scr_particlesUpdate(){ //Можно использовать при переходе между комнатами
part_system_depth(global.ps,-room_height+1);
}

function scr_particlesDestroy(){ //Для Game end глобального контроллера
part_system_destroy(global.ps);
part_system_destroy(global.ps_dynamic);
part_system_destroy(global.ps_above);
part_system_destroy(global.ps_below);

part_type_destroy(global.pt_shrdGlob);

part_type_destroy(global.pt_smoke);
part_type_destroy(global.pt_smokeUP);
part_type_destroy(global.pt_smokeTrace);
part_type_destroy(global.pt_fire);
part_type_destroy(global.pt_electric);
part_type_destroy(global.pt_toxic);
part_type_destroy(global.pt_waterSplash);
part_type_destroy(global.pt_rain);
part_type_destroy(global.pt_sparkFX);
part_type_destroy(global.pt_healingFX);
part_type_destroy(global.pt_warmingFX);
part_type_destroy(global.pt_buffFX);
part_type_destroy(global.pt_acidRain);
part_type_destroy(global.pt_acidSplash);
part_type_destroy(global.pt_fog);
part_type_destroy(global.pt_stenchUP);
}