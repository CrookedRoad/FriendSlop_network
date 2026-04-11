depth = -10000;
randomize();

global.buildingConfig = false;
global.gameDemo = true;

#region Main
globalvar showGameInfo;
showGameInfo = true;
globalvar debugOverlay;
debugOverlay = false;
globalvar showHitbox;
showHitbox = false;
globalvar skipIntro;
skipIntro = true;
globalvar test_mode;
test_mode = false;
global.testRoom = test_rm;

globalvar version;
version = "0.0.1";
globalvar versionValue;
versionValue = 0.1;

//Steam
scr_steam_init();
//Social buttons
//scr_socialButtons_init();
#endregion

#region Settings
//resolution
global.aspectRatio = 1;
global.ratio[0] = {_width : 960 , _height : 720} //4:3
global.ratio[1] = {_width : 1280, _height : 720} //16:9
global.ratio[2] = {_width : 1680, _height : 720} //21:9
global.ratio[3] = {_width : 2560, _height : 720} //32:9
scr_monitorType_define();

global.display_width = display_get_width();
global.display_height = display_get_height();
global.window_width_basic = global.ratio[global.aspectRatio]._width;
global.window_height_basic = global.ratio[global.aspectRatio]._height;
global.window_width = global.window_width_basic;
global.window_height = global.window_height_basic;

//GUI
global.guiLayerFade = 0.2;
global.gui_mouseX = 0;
global.gui_mouseY = 0;
global.gui_width_basic = global.ratio[global.aspectRatio]._width;
global.gui_height_basic = global.ratio[global.aspectRatio]._height;
global.gui_width = global.gui_width_basic;
global.gui_height = global.gui_height_basic;
global.gui_scaling = global.gui_height/global.gui_height_basic;
display_set_gui_size(global.gui_width,global.gui_height);

//view
global.viewScale = 1;
global.view_zoom = 1;
global.view_width_basic = (global.window_width_basic/2)/global.viewScale;
global.view_height_basic = (global.window_height_basic/2)/global.viewScale;
global.viewMoveBlock = false;

global.cameraXpos = 0;
global.cameraYpos = 0;
global.cameraWidth = 0;
global.cameraHeight = 0;
global.cameraZoom = false;

global.mouseX = 0;
global.mouseY = 0;

global.timeSec_const = 60;

//game control
global.gameControl = 0;
global.gp_main = 0;

scr_gameSettings("init");
#endregion

scr_globalGameParameters("init");

#region DataBase Init
scr_colorData();
scr_textData("init");
scr_inputData("init");

scr_IAV_guard_init();
scr_loadedBanner_init();

global.screenshotDirectory = "Screenshots";
#endregion

scr_gameSettings("load");

instance_create_depth(0, 0, 0, o_gameCursor);
instance_create_depth(0, 0, 0, o_intro);
scr_particlesInit();