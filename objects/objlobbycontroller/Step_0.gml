/// @description Insert description here
// You can write your code in this editor

if (!isReady) return;

var _ready = 0;
with (objPlayer) {
	_ready += isReady;
}
if (_ready == 4) room_goto(rm_level);

