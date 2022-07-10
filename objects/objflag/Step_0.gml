/// @description Insert description here
// You can write your code in this editor

var _instance = collision_circle(x, y, 35, objPlayer, false, true);
if (_instance) {
	
	// Exit if this is recurrent
	if (lastInteraction == _instance) return;
	lastInteraction = _instance;
	
	var _id = _instance.player_id;

	// If this was a stolen flag earn 2 points else 1
	global.playerPoints[_id] += team == undefined ? 1 : 2;
	
	// If this was the first flag ever collected in this run earn 5 points
	global.playerPoints[_id] += global.numberOfCaughtFlags == 0 ? 5 : 0;
	
	var _team = getPlayerTeam(_id);
	var _color = getTeamColor(_team);
	
	team = _team;
	image_blend = _color;
	
	// Increment the number of flags caught
	global.numberOfCaughtFlags += 1;
	
	audio_play_sound(sndFlagCollect, 1, false);
}
