 function scr_steamConnection_check(){
if (global.networkConnection){
	if global.buildType == "steam" && (global.steamAPI){
		return(1);
	}
	return(0);
}

return(-1);
}