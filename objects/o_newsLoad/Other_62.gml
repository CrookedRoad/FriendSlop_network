if (async_load[? "id"] == request_id)
{
    var _status = async_load[? "status"];
    if (_status == 0)
    {
        alarm[2] = 10;
    }
    if (_status < 0)
    {
		if requestCounter < requestLimit{
			alarm[1] = 60;
		} else instance_destroy();
    }
}