/// @description Insert description here
// You can write your code in this editor

if (hasData) return;

for (var _it = 0; _it < 2; _it++) {
	var _info = global.playerInfo[players[_it]];
	if (_info != undefined) {
		names[_it] = _info.player_name;
		sprites[_it] = _info.player_avatar_sprite
		hasData = true;
	}
}










