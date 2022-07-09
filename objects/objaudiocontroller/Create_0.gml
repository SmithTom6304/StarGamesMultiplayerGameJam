/// Background music for when the players are racing

sound = undefined;
queue = undefined;

function playAudio(_audioFile, _time) {
	if (sound == undefined) {
		sound = audio_play_sound(_audioFile, 1000, true);
		audio_sound_gain(sound, .5, 0);
	}
	else {
		queue = _audioFile;
		audio_sound_gain(sound, 0, _time);
	}
}

function stopAudio() {
	if (sound != undefined)
	audio_stop_sound(sound);
}

