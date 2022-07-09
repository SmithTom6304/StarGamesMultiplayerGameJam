/// @description Insert description here
// You can write your code in this editor

// Inherit the parent event
event_inherited();

global.numberOfCaughtFlags = 0;
global.playerPoints = [0, 0, 0, 0];

global.terrainLayer = layer_tilemap_get_id("TerrainStats");

// Audio audio for level!!
global.audioController.playAudio(sndLevel, 1000);