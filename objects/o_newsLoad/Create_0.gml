urlData_name = "bannerData";
url_fileName = string(urlData_name)+".txt";
urlID = "https://crookedroad.github.io/AngelsDreams_url_data/bannerData.html";

requestCounter = 0;
requestLimit = 10;

request_id = 0;
loadNews_index = 0;
addNews_index = 0;

if directory_exists(global.newsDirectory) then directory_destroy(global.newsDirectory);
alarm[0] = 30;