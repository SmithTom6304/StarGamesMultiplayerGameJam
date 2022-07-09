/// @description Insert description here
// You can write your code in this editor

isReady = false;

// Audio audio for lobby!!
if (global.audioController == undefined) {
	global.audioController = instance_create_depth(0, 0, 0, objAudioController);
}
global.audioController.playAudio(sndLobby, 1000);