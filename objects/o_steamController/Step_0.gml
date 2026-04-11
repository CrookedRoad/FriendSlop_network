steam_update();

var file = ("Screenshot_"+string(current_day)+"_"+string(current_month)+"_"+string(current_year)+"_"+string(current_hour)+string(current_minute)+string(current_second)+".png");
if global.steamAPI == true{
if (screenshotcooldown == false){
   screenshotcooldown = true;
   alarm[11] = (global.timeSec_const*1.1);

   if steam_is_screenshot_requested(){
	   if !directory_exists(global.screenshotDirectory) then directory_create(global.screenshotDirectory);
       screen_save(global.screenshotDirectory+"/"+file);
       steam_send_screenshot(global.screenshotDirectory+"/"+file, window_get_width(), window_get_height());
   }
}
} else{
if keyboard_check_pressed(vk_f12) || makeScreenShot_action == true{
   if !directory_exists(global.screenshotDirectory) then directory_create(global.screenshotDirectory);
	   screen_save(global.screenshotDirectory+"/"+file);
	   makeScreenShot_action = false;
}
}