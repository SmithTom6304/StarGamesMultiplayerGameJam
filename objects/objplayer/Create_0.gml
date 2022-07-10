/// @description Insert description here
// You can write your code in this editor

// ### INITIAL SETUP ###
//image_xscale = .8
//image_yscale = .8
image_speed = 0;

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
isDrifting = false;
wasDrifting = false;
isReady = false;

positionX = x;
positionY = y;
stuckCount = 0;

ignoreInput = false;
update = waitUpdate;

switch (room) {
	case rm_level:
		if (player_id == global.playerId) {
			instance_create_layer(x, y, layer, objCamera, { follow: id });
		}
		break;
	case rm_lobby: update = lobbyUpdate; break;
	case rm_stats: update = statsUpdate; break;
}