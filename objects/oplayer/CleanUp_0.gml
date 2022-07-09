/// @description Insert description here
// You can write your code in this editor

if (global.carSound) audio_stop_sound(global.carSound);

global.carSound = undefined;
audio_emitter_free(audioEmitter);

