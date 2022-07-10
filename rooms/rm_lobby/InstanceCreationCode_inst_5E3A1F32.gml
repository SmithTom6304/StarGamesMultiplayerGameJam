
title = "GO!!"

step = function() {
	
	if (wasPressed) return;
	
	var _id = global.playerId;
	if (_id = undefined) return;
	
	if (global.playerReady[_id]) {
		wasPressed = true
		title = "WAITING...";
	}
}