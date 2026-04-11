/// @description Загрузка баннеров
if file_exists(global.newsDirectory+"/"+url_fileName){
var langDir = "eng";
	if lng == 0 then langDir = "ru";
	
var findBanner = "";
	ini_open(global.newsDirectory+"/"+url_fileName);
	if ini_section_exists("bannerList"){
		findBanner = ini_read_string("bannerList", "banner_"+string(loadNews_index), "");
	}
	
	if findBanner != "" && ini_section_exists(findBanner){
	//dateConfig: perm, hide, 1/1|2/2
	var correctDate = false;
	var readDate = ini_read_string(findBanner, "date", "");
	    if readDate == "perm" then correctDate = true;
		if readDate == "hide"{
			correctDate = false;
		} else{
		    if readDate != "" && !correctDate{
		        correctDate = scr_check_datePeriod(readDate);
		    }
		}
		if (correctDate){
		var readSpriteURL = ini_read_string(findBanner, "image_"+langDir, "");
			if readSpriteURL != ""{
				http_get_file(string(readSpriteURL), global.newsDirectory+"/"+"banner_"+string(addNews_index)+".png");
			} else{
				readSpriteURL = ini_read_string(findBanner, "image", "");
				if readSpriteURL != ""{
					http_get_file(string(readSpriteURL), global.newsDirectory+"/"+"banner_"+string(addNews_index)+".png");
				}
			}
		var readURL = ini_read_string(findBanner, "url", "");
	        if readURL != ""{
	            global.loadedBanner_url[addNews_index] = string(readURL);
	        }
		var readClipboardString = ini_read_string(findBanner, "clipboard", "");
	        if readClipboardString != ""{
	            global.loadedBanner_clipboard[addNews_index] = string(readClipboardString);
	        }
			
		var readNameString = ini_read_string(findBanner, "header_"+langDir, "");
	        if readNameString != ""{
	            global.loadedBanner_name[addNews_index] = string(readNameString);
	        }
		var readMessageString = ini_read_string(findBanner, "message_"+langDir, "");
	        if readMessageString != ""{
	            global.loadedBanner_message[addNews_index] = string(readMessageString);
	        }
			
			addNews_index ++;
		}
	}
	ini_close();
}

loadNews_index ++;
if (loadNews_index < global.loadedBannerLimit) then alarm[2] = 15 else alarm[3] = 60;