///@function scr_codeName_generator(length)
function scr_codeName_generator(argument0){
var stringLength = argument0;
var letter;
    letter[0] = "a";
    letter[1] = "b";
    letter[2] = "c";
    letter[3] = "d";
    letter[4] = "e";
    letter[5] = "f";
    letter[6] = "g";
    letter[7] = "h";
    letter[8] = "i";
    letter[9] = "j";
    letter[10] = "k";
    letter[11] = "l";
    letter[12] = "m";
    letter[13] = "n";
    letter[14] = "o";
    letter[15] = "p";
    letter[16] = "q";
    letter[17] = "r";
    letter[18] = "s";
    letter[19] = "t";
    letter[20] = "u";
    letter[21] = "v";
    letter[22] = "w";
    letter[23] = "x";
    letter[24] = "y";
    letter[25] = "z";
    
var codeName = "";

randomize();
for(var _l=0; _l<stringLength; _l++)
{
    var symbol = choose("letter", "number");
    switch(symbol)
    {
        case "letter":
            codeName += string(letter[irandom(array_length(letter)-1)]);
        break;
        case "number":
            codeName += string(irandom(9));
        break;
    }
}

return(codeName);
}