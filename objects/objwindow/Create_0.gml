/// @description Insert description here
// You can write your code in this editor

title = "TITLE";
titleFont = -1;
titleColor = c_white;
titleOffset = 20;
titleHAlign = fa_center;

contents = "CONTENTS";
contentsFont = -1;
contentsColor = c_white;
contentsHOffset = 20;
contentsVOffset = 20;
contentsHAlign = fa_left;
contentsVAlign = fa_top;

function drawTitle() {
	var _x, _y;
	draw_set_valign(fa_top);
	draw_set_halign(titleHAlign);
	draw_set_font(titleFont);
	switch (titleHAlign)
	{
		case fa_left: _x = x - titleOffset; _y = y - titleOffset; break;
		case fa_center: _x = x + sprite_width * .5; _y = y - titleOffset; break;
		case fa_right: _x = x + titleOffset; _y = y + sprite_width + titleOffset; break;
	}
	
	draw_set_color(c_black);
	draw_text(_x-4, _y, title);
	draw_text(_x+4, _y, title);
	draw_text(_x, _y-4, title);
	draw_text(_x, _y+4, title);
	draw_set_color(titleColor);
	draw_text(_x, _y, title);
}

function drawContents() {
	var _x, _y;
	draw_set_halign(contentsHAlign);
	draw_set_valign(contentsVAlign);
	draw_set_color(contentsColor);
	draw_set_font(contentsFont);
	_x = x + contentsHOffset;
	_y = y + contentsVOffset;
	
	draw_text(_x, _y, contents);
}

draw = function() {
	
	draw_self();

	drawTitle();
}