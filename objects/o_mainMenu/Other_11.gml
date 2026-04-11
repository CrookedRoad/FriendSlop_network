/// @description Переход к другой секции
if nextSection != ""{
	section = nextSection;
	nextSection = "";
	pressedButton = -1;
	selbut = -1;
	sectionShow = true;
	
	if (keyboardUse) then selectedButton = 0;
	for(i=0; i<button_limit; i++)
	{
		button_offset[i] = -500;
	}
}