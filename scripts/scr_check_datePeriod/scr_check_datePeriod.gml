///@function scr_check_datePeriod(01/01|02/02)
function scr_check_datePeriod(argument0){
var period = argument0;

var startDate, endDate; //Получение даты начала и даты завершения
	if string_count("|", period) != 0{
	var acsessorPos = string_pos("|", period);
		startDate = string_copy(period, 0, acsessorPos-1);
		endDate = string_copy(period, acsessorPos+1, string_length(period)-acsessorPos);
	}
    //show_debug_message("start:  "+string(startDate));
    //show_debug_message("end:  "+string(endDate));
	
var startMonth, startDay; //Разбор даты начала
	if string_count("/", startDate) != 0{
	var acsessorPos = string_pos("/", startDate);
		startDay = string_copy(startDate, 0, acsessorPos-1);
		startMonth = string_copy(startDate, acsessorPos+1, string_length(startDate)-acsessorPos);
	}
    //show_debug_message("s_m:  "+string(startMonth));
    //show_debug_message("s_d:  "+string(startDay));
	
var endMonth, endDay; //Разбор даты завершения
	if string_count("/", endDate) != 0{
	var acsessorPos = string_pos("/", endDate);
		endDay = string_copy(endDate, 0, acsessorPos-1);
		endMonth = string_copy(endDate, acsessorPos+1, string_length(endDate)-acsessorPos);
	}
    //show_debug_message("e_m:  "+string(endMonth));
    //show_debug_message("e_d:  "+string(endDay));
	

var realYear = 	date_get_year(date_current_datetime());
var compareStart = date_compare_date(date_create_datetime(realYear, startMonth, startDay, 0, 0, 0), date_current_datetime());
var compareEnd = date_compare_date(date_create_datetime(realYear, endMonth, endDay, 0, 0, 0), date_current_datetime());
    if (compareStart != 1 && compareEnd != -1){
        //show_debug_message("date_period: correct");
        return(true);
    }

//show_debug_message("date_period: incorrect");
return(false);
}