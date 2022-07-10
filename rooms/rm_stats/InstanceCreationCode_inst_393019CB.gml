
title = "REMATCH!!"

alarm[0] = 80;
visible = false;

step = function() {
	
	if (alarm[0] < 0) visible = true;
	if (!visible) return;
	
	if (wasPressed) return;
	
	var _id = global.playerId;
	if (_id = undefined) return;
	
	if (global.playerReady[_id]) {
		wasPressed = true
		title = "WAITING...";
	}
}