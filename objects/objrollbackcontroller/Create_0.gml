/// @description Insert description here
// You can write your code in this editor

// This should only initialize the rollback
// If it is already initialized destroy controller
if (global.rollbackInitialized) {
	instance_destroy()
	return;
}

rollback_define_player(oPlayer);

rollback_define_input(global.gameControls);

// In not joining a game
if (!rollback_join_game()) {
	// Create the game
	rollback_create_game(4, true);
}