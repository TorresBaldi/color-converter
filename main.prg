program color_converter;

import "mod_say";
import "mod_string";

const
    R_COMPONENT = 0;
    G_COMPONENT = 1;
    B_COMPONENT = 2;
end

declare function string color_converter_rgb2hex(byte r, byte g, byte b); end
declare function int color_converter_hex2dec(string hex_string, byte color_component); end
declare function string dec2hex_component(byte decnum); end
declare function string zero_pad(string str, int len); end
declare function int hex2dec_single_digit(string hex_digit); end
declare function int get_hex2dec_value(string hex_string, int index); end

begin

    // example usage

    say(color_converter_rgb2hex(175,78,161));

    say(color_converter_hex2dec("af4ea1", R_COMPONENT));
    say(color_converter_hex2dec("AF4EA1", G_COMPONENT));
    say(color_converter_hex2dec("aF4ea1", B_COMPONENT));

end

// get hexadecimal representation of a color
function string color_converter_rgb2hex(byte r, byte g, byte b)
private
    string temp;
end
begin
    return "#" + zero_pad(dec2hex_component(r), 2) + zero_pad(dec2hex_component(g), 2) + zero_pad(dec2hex_component(b), 2);
end

// get decimal representation of a color
function int color_converter_hex2dec(string hex_string, byte color_component)
private
    byte result = 0;
    byte pos = 0;
end
begin
    pos = color_component * 2;
    result += get_hex2dec_value(hex_string, pos) * 16;
    result += get_hex2dec_value(hex_string, pos + 1);
    return result;
end

function string dec2hex_component(byte decnum)
private
    int i, quot, temp;
    string result = "";
end
begin
    quot = decnum;
    while(quot > 0)
        temp = quot % 16;
        if (temp < 10)
            temp = temp+48;
        else
            temp = temp+55;
        end
        result += chr(temp);
        quot=quot/16;
    end
    return result;
end

function string zero_pad(string str, int len)
private
    string temp = "000000";
end
begin
    temp += str;
    temp = strrev(temp);
    temp = substr(temp, 0, len);
    return temp;
end

function int hex2dec_single_digit(string hex_digit)
begin
    switch(lcase(hex_digit))
        case "a":
            return 10;
        end
        case "b":
            return 11;
        end
        case "c":
            return 12;
        end
        case "d":
            return 13;
        end
        case "e":
            return 14;
        end
        case "f":
            return 15;
        end
        case "0","1","2","3","4","5","6","7","8","9":
            return atoi(hex_digit);
        end
        default:
            return -1;
        end
    end
end

function int get_hex2dec_value(string hex_string, int index)
begin
    return hex2dec_single_digit(substr(hex_string, index, 1));
end

