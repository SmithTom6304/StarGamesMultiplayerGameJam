/// @description Insert description here
// You can write your code in this editor

enum GAMEPLAY_STATS {
	START,
	RUNNING,
	ENDING,
	END
}

guiCenter = display_get_gui_width() * .5;

// Inherit the parent event
event_inherited();

global.numberOfCaughtFlags = 0;

global.playerPoints = [0, 0, 0, 0];
global.playerFlagsCollected = [0, 0, 0, 0];
global.playerFlagsStolen = [0, 0, 0, 0];
global.playerFirstFlag = [0, 0, 0, 0];
global.playerDrifts = [0, 0, 0, 0];
global.playerReverseBonus = [1, 1, 1, 1];
global.playerCollideBonus = [1, 1, 1, 1];
global.teamMoreFlags = [0, 0];

global.terrainLayer = layer_tilemap_get_id("TerrainStats");

// Audio audio for level!!
global.audioController.playAudio(sndLevel, 1000);

state = GAMEPLAY_STATS.START;

with (objPlayer) {
	update = waitUpdate;
}

startSound = undefined;
