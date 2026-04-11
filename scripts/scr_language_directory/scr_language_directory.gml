///@function scr_language_directory(lng_index)
function scr_language_directory(argument0){
var langDir = "eng";
var lngIndex = argument0;
	switch(lngIndex)
	{
	    case 0: langDir = "ru"; break;
	    case 1: langDir = "eng"; break;
	    case 2: langDir = "pt_br"; break;
	    case 3: langDir = "deu"; break;
	    case 4: langDir = "fra"; break;
	    case 5: langDir = "ita"; break;
	    case 6: langDir = "chs"; break;
	}
	
	return(langDir);
}