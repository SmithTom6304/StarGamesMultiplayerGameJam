/// @description Insert description here
// You can write your code in this editor

if (!isReady) return;

switch (state) {

	case GAMEPLAY_STATS.START:
	
		if (startSound == undefined) {
			startSound = audio_play_sound(SFX_starting_beep_v1, 1, false);
		}
		
		if (!audio_is_playing(startSound)) {
			
			with(objPlayer) {
				update = gameplayUpdate;
			}
			state = GAMEPLAY_STATS.RUNNING;
		}
		
		// This is such an hack but it's on purpose
		alarm[0] = 60*90;
		break;

	case GAMEPLAY_STATS.RUNNING:
		break;
		
	case GAMEPLAY_STATS.ENDING:
		with(objPlayer) {
			ignoreInput = true;
		}
		calculatePoints();
		
		alarm[1] = 60*2;
		audio_play_sound(sndApplause, 1, false);
		state = GAMEPLAY_STATS.END;
		break;
}































