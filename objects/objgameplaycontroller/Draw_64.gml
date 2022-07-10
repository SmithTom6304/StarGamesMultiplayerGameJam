/// @description Insert description here
// You can write your code in this editor

var _timer = alarm[0];
if (alarm[0] < 0) _timer = 0;

draw_set_halign(fa_center);
draw_set_valign(fa_top);


var _timeMinutes = _timer div 3600;
var _timeSeconds = (_timer / 60) - _timeMinutes * 60;

var _minutesString = string(_timeMinutes);
var _secondsString = _timeSeconds < 10 ? "0" + string(_timeSeconds) : string(_timeSeconds);

draw_set_color(c_black);
draw_text(guiCenter + 4, 50, _minutesString + ":" + _secondsString);
draw_text(guiCenter - 4, 50, _minutesString + ":" + _secondsString);
draw_text(guiCenter, 50 + 4, _minutesString + ":" + _secondsString);
draw_text(guiCenter, 50 - 4, _minutesString + ":" + _secondsString);

draw_set_color(_timeMinutes == 0 && _timeSeconds < 5 ? c_red : c_white);
draw_text(guiCenter, 50, _minutesString + ":" + _secondsString);










