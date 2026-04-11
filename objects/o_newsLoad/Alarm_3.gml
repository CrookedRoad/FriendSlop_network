/// @description Загрузка спрайтов
for(var _i=0; _i<global.loadedBannerLimit; _i++)
{
var fname = global.newsDirectory+"/"+"banner_"+string(_i)+".png";
	if file_exists(fname){
		global.loadedBanner_sprite[_i] = sprite_add(fname, 0, 0, 0, 556, 23);
	}
}

if instance_exists(o_gameNews_list){
	with(o_gameNews_list){
		alarm[0] = 10;
	}
}
instance_destroy();