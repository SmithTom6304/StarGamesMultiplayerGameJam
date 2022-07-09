/// @description Insert description here
// You can write your code in this editor

// ### INITIAL SETUP ###
image_xscale = .8
image_yscale = .8

var _location = getPlayerInitLocation(player_id);
x = _location.x;
y = _location.y;

var _team = getPlayerTeam(player_id);
sprite_index = getTeamSprite(_team);

// ### EDITABLE PROPERTIES ###
wheelBase = 40;
steerAngle = 12;
enginePower = 1.5;
brakingPower = -.9;
maxReverseSpeed = 30;

frictionAmount = -.08
dragAmount = -0.0015;

// ### INTERNAL VARIABLES ###
steerDirection = 0;
accelerationX = 0;
accelerationY = 0;
directionX = 1;
directionY = 0;
velocityX = 0;
velocityY = 0;

audioEmitter = audio_emitter_create();
audio_emitter_gain(audioEmitter, 0.3);
isIdled = false;

update = waitUpdate;

