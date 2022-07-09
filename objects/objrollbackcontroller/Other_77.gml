/// @description Insert description here
// You can write your code in this editor

if (global.rollbackInitialized) return;

if (rollback_event_param.first_start)
	global.rollbackInitialized = true;

instance_destroy();
