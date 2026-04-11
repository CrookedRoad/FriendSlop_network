function hex_to_color(argument0){
var _hex = argument0;
    if (string_length(_hex) != 6) return c_white;

    var _r = string_copy(_hex, 1, 2);
    var _g = string_copy(_hex, 3, 2);
    var _b = string_copy(_hex, 5, 2);

    // Собираем в формате $BBGGRR (шестнадцатеричный литерал GM)
    return make_color_rgb(
        hex_to_dec(_r), 
        hex_to_dec(_g), 
        hex_to_dec(_b)
    );
}

// Простая функция для перевода HEX-пары в число (0-255)
function hex_to_dec(argument0){
    var _res = 0;
    var _hex_digits = "0123456789ABCDEF";
    var _s = string_upper(argument0);
    
    for (var _i = 1; _i <= string_length(_s); _i++) {
        _res = _res << 4;
        _res += string_pos(string_char_at(_s, _i), _hex_digits) - 1;
    }
    return _res;
}