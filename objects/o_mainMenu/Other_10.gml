/// @description Действие кнопки меню
if selectedButton != -1 && selectedButtonIndex != ""{
var playSound = snd_menuButtonSelect;
scr_menuButtonActions_mainMenu();
scr_menuButtonActions_settings();
scr_menuButtonActions_multiplayer();

scr_soundPlay(playSound, global.globVol*global.intVol, 0, 0, 0, -1);
}