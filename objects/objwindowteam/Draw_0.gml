/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

if (!hasData) return;

var _x = x + contentsHOffset;
var _y = y + contentsVOffset;

var _lineVOffset = 70;
var _lineHOffset = x + contentsHOffset + 10;
var _lineSize = sprite_width - 2 * (contentsHOffset + 10)

var _textVOffset = 75;
var _textHOffset = x + contentsHOffset + 110;

draw_set_halign(fa_left);
draw_set_valign(fa_bottom);
draw_set_font(contentsFont);

for (var _it = 0; _it < 2; _it++) {
	
	var _lineY =  _y + _lineVOffset + _it*120
	draw_line_width_color(_lineHOffset, _lineY, _lineHOffset + _lineSize, _lineY, 10, lineColor, lineColor);
	
	draw_sprite_stretched_ext(sprites[_it], 0, _x, _y+_it*120, 100, 100, c_white, 1);

	var _textX = _textHOffset;
	var _textY =  _y + _textVOffset + _it*120
	draw_text(_textX, _textY, names[_it]);
}