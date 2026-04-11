isVisible = true;
if !instance_exists(o_mainMenu) then isVisible = false;

loadIcoAngle -= 5;

if ds_exists(bannerList, ds_type_list) && ds_exists(bannerData, ds_type_map){
var listSize = ds_list_size(bannerList);
	for(i=0; i<listSize; i++)
	{
		if bannerAlpha[i] < 1 then bannerAlpha[i] += 0.1;
		if selectedBanner == i{
			bannerXoffset[i] = lerp(bannerXoffset[i], 30, 0.1);
		} else{
			bannerXoffset[i] = lerp(bannerXoffset[i], 0, 0.1);
		}
	}
	if listSize == 0 then instance_destroy();
}

stripYoffsetDraw = lerp(stripYoffsetDraw, stripYoffset, 0.1);
if stripYoffsetDraw > 15{
	if headerAlpha > 0 then headerAlpha -= 0.1;
} else{
	if headerAlpha < 1 then headerAlpha += 0.1;
}

switch(show)
{
	case true:
	switch(isVisible)
	{
		case true: if glob_alpha < 1 then glob_alpha += 0.05; break;
		case false: if glob_alpha > 0 then glob_alpha -= 0.1; break;
	}
	xpos = lerp(xpos, xposBasic, 0.1);
	break;
	case false:
		if glob_alpha > 0 then glob_alpha -= 0.05 else{
			instance_destroy();
			if (refreshNews){
				instance_create_depth(0, 0, 0, o_gameNews_list);
			}
		}
		
		xpos = lerp(xpos, xposBasic+500, 0.1);
	break;
}