glob_alpha = 0;
alpha = 1;
show = true;

resetProgress = false;

keyboardControlDelay = 0;
keyboardUse = false;
mouseX = global.gui_mouseX;
mouseY = global.gui_mouseY;

section = "menu";
sectionShow = true;
nextSection = "";
prevSection = "";
button_limit = 10;
button_width = 300;
selbut = -1;
selectedButton = -1;
pressedButton = -1;
selectedButtonIndex = "";
for(i=0; i<button_limit; i++)
{
	button_offset[i] = -500;
	button_valueAlpha[i] = 1;
	amountBar_key[i] = false;
}

for(i=0; i<10; i++)
{
var _langDir = scr_language_directory(i);
	langAvailable[i] = false;
	if directory_exists(global.locDirectory+"/"+_langDir) && file_exists(global.locDirectory+"/"+_langDir+"/"+"auxiliary_values.txt"){
		langAvailable[i] = true;
	}
}