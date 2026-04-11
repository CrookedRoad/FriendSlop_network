depth = -1001;

refreshNews = false;
show = true;
isVisible = true;
glob_alpha = 0;
xpos = global.gui_width_basic-20;
ypos = 65;
xposBasic = xpos;
yposBasic = ypos;
xpos += 500;

header = global.textData[? "newsMenuHeader"];
headerAlpha = 1;
headerBackColor = make_color_hex("262223");
loadIcoAngle = 0;
loadTxt = global.textData[? "loadingNews"];

selbut = -1;
selectedBanner = -1;
stripYoffsetMax = 0;
stripYoffset = 0;
stripYoffsetDraw = 0;

bannerList = ds_list_create();
bannerData = ds_map_create();

bannerData[? "scale"] = 0.5;

loadedBannerPos = 0;
scr_embeddedBanners_init();

for(i=0; i<25; i++)
{
	bannerXoffset[i] = 0;
	bannerAlpha[i] = 1;
}

if !global.news then instance_destroy();