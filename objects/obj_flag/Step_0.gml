/// @description Insert description here
// You can write your code in this editor

var _instance = collision_circle(x, y, 20, oPlayer, false, true);
with (_instance) {
	
	
	
	if (other.lastInteraction == _instance) return;
	
	other.lastInteraction = _instance;
	
	// If this was a stolen flag earn 2 points else 1
	points += other.team == undefined ? 1 : 2;
	
	// If this was the first flag ever collected in this run earn 5 points
	// points += global.numberOfCaughtFlags == 0 ? 5 : 0;
	
	other.team = team;
	other.image_blend = color;
	
	// Increment the number of flags caught
	global.numberOfCaughtFlags += 1;
}

