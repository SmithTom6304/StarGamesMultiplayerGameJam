/// @description Insert description here
// You can write your code in this editor

if (global.rollbackInitialized) return;

if (rollback_event_param.first_start)
	global.rollbackInitialized = true;

global.playerId = rollback_event_param.player_id;

instance_destroy();
