/// @description Insert description here
// You can write your code in this editor

if (audio_sound_get_gain(sound) == 0) {
	audio_stop_sound(sound);
	sound = undefined;
}

if (sound == undefined && queue != undefined) {
	sound = audio_play_sound(queue, 1000, true);
	queue = undefined;
}









