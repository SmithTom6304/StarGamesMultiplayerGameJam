/// @description Insert description here
// You can write your code in this editor

if (!isReady) return;

switch (state) {

	case GAMEPLAY_STATS.START:
	
		if (startSound == undefined) {
			startSound = audio_play_sound(SFX_starting_beep_v1, 1, false);
		}
		
		if (!audio_is_playing(startSound)) {
			
			with(oPlayer) {
				update = gameplayUpdate;
			}
			
			alarm[0] = 60*90;
			state = GAMEPLAY_STATS.RUNNING;
		}
		break;

	case GAMEPLAY_STATS.RUNNING:
		break;
		
	case GAMEPLAY_STATS.ENDING:
		break;
}































