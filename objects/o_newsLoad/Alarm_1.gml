/// @description Отправка запроса на файл
if global.networkConnection == true{
    request_id = http_get_file(string(urlID), global.newsDirectory+"/"+url_fileName);
	requestCounter ++;
}