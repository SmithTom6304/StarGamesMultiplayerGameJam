/// @description Insert description here
// You can write your code in this editor

draw_self();
drawTitle();

var _categories = [
	"[Flags Collected]",
	"[Flags Stolen]",
	"[Only Reverse Bonus]",
	"[No Collision Bonus]",
	"[First Flag Bonus]",
	"[Most Drifts Bonus]",
	"[Most Ending Flags]",
	"",
	"[Total points]"
];

draw_set_valign(fa_top);
draw_set_font(contentsFont);
draw_set_color(contentsColor);

var _teamPlayers = [ [0, 1], [2, 3] ];

var _categoryYOffset = 60;
var _valuesXOffset = 400;
var _len = array_length(_categories);
for (var _it = 0; _it < _len; _it++) {
	
	draw_set_halign(fa_left);
	var _y = y + _categoryYOffset + contentsVOffset + 35*_it;
	draw_text(x + contentsHOffset, _y, _categories[_it]);
	
}

var _labels = ["RED", "BLUE"];

_y = y + contentsVOffset + 20;
for (var _j = 0; _j < 2; _j++) {
	
	var _players = _teamPlayers[_j];
	
	var _x = x + contentsHOffset + _valuesXOffset + _j*180;
	draw_set_halign(fa_center);
		
	var value = _labels[_j];
	var color = global.teamToColor[_j];
	draw_text(_x+2, _y, value);
	draw_text(_x-2, _y, value);
	draw_text(_x, _y+2, value);
	draw_text(_x, _y-2, value);
	draw_set_color(color);
	draw_text(_x, _y, value);
	draw_set_color(c_white);
}


_it = 0;
_y = y + _categoryYOffset + contentsVOffset + 35*_it;
for (var _j = 0; _j < 2; _j++) {
	
	var _players = _teamPlayers[_j];
	
	var _x = x + contentsHOffset + _valuesXOffset + _j*180;
	draw_set_halign(fa_center);
		
	var value = global.playerFlagsCollected[_players[0]] + global.playerFlagsCollected[_players[1]];		
	draw_text(_x, _y, string(value) + " (x1)");	
}

_it = 1;
_y = y + _categoryYOffset + contentsVOffset + 35*_it;
for (var _j = 0; _j < 2; _j++) {
	
	var _players = _teamPlayers[_j];
	
	var _x = x + contentsHOffset + _valuesXOffset + _j*180;
	draw_set_halign(fa_center);
		
	var value = global.playerFlagsStolen[_players[0]] + global.playerFlagsStolen[_players[1]];		
	draw_text(_x, _y, string(value) + " (x2)");	
}

_it = 2;
_y = y + _categoryYOffset + contentsVOffset + 35*_it;
for (var _j = 0; _j < 2; _j++) {
	
	var _players = _teamPlayers[_j];
	
	var _x = x + contentsHOffset + _valuesXOffset + _j*180;
	draw_set_halign(fa_center);
		
	var value = global.playerReverseBonus[_players[0]] + global.playerReverseBonus[_players[1]];		
	draw_text(_x, _y, string(value) + " (x6)");	
}

_it = 3;
_y = y + _categoryYOffset + contentsVOffset + 35*_it;
for (var _j = 0; _j < 2; _j++) {
	
	var _players = _teamPlayers[_j];
	
	var _x = x + contentsHOffset + _valuesXOffset + _j*180;
	draw_set_halign(fa_center);
		
	var value = global.playerCollideBonus[_players[0]] + global.playerCollideBonus[_players[1]];		
	draw_text(_x, _y, string(value) + " (x6)");	
}

_it = 4;
_y = y + _categoryYOffset + contentsVOffset + 35*_it;
for (var _j = 0; _j < 2; _j++) {
	
	var _players = _teamPlayers[_j];
	
	var _x = x + contentsHOffset + _valuesXOffset + _j*180;
	draw_set_halign(fa_center);
		
	var value = global.teamFirstFlag[_j];
	draw_text(_x, _y, "+"+string(8*value));
}

_it = 5;
_y = y + _categoryYOffset + contentsVOffset + 35*_it;
for (var _j = 0; _j < 2; _j++) {
	
	var _players = _teamPlayers[_j];
	
	var _x = x + contentsHOffset + _valuesXOffset + _j*180;
	draw_set_halign(fa_center);
	
	var value = global.teamDriftBonus[_j]	
	draw_text(_x, _y, "+"+string(6*value));
}

_it = 6;
_y = y + _categoryYOffset + contentsVOffset + 35*_it;
for (var _j = 0; _j < 2; _j++) {
	
	var _players = _teamPlayers[_j];
	
	var _x = x + contentsHOffset + _valuesXOffset + _j*180;
	draw_set_halign(fa_center);
		
	var value = global.teamMoreFlags[_j]	
	draw_text(_x, _y, "+"+string(10*value));	
}

_it = 8;
_y = y + _categoryYOffset + contentsVOffset + 35*_it;
for (var _j = 0; _j < 2; _j++) {
	
	var _players = _teamPlayers[_j];
	
	var _x = x + contentsHOffset + _valuesXOffset + _j*180;
	draw_set_halign(fa_center);
		
	var value = global.teamPoints[_j]	
	draw_text(_x, _y, value);	
}






