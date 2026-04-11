steam_sendBuffer = buffer_create(1024, buffer_grow, 1);

tickrate = global.mp_tickrate;
sendData_timer = tickrate;