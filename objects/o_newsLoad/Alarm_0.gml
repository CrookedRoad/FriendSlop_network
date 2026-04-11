/// @description Очистка старых данных
for(var _i=0; _i<global.loadedBannerLimit; _i++)
{
	if global.loadedBanner_sprite[_i] != 0 && sprite_exists(global.loadedBanner_sprite[_i]){
		sprite_delete(global.loadedBanner_sprite[_i]);
		global.loadedBanner_sprite[_i] = 0;
	}
}

scr_loadedBanner_init();

alarm[1] = 30;