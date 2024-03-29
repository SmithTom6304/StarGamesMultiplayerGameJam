/// @description Insert description here
// You can write your code in this editor

// This should only initialize the rollback
// If it is already initialized destroy controller
if (global.rollbackInitialized) {
	instance_destroy()
	return;
}

// Audio audio for lobby!!
global.audioController = instance_create_depth(0, 0, 0, objAudioController);

rollback_define_player(objPlayer);

rollback_define_input(global.gameControls);

rollback_display_events(false);

// In not joining a game
if (!rollback_join_game()) {
	// Create the game
	rollback_create_game(4, false);
}