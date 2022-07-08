/// @description Insert description here
// You can write your code in this editor

y = room_height/2;

image_xscale = .8
image_yscale = .8

if (player_id == 0) { x = 2045; y = 1000; }
else if (player_id == 1) x = room_width - 200;

// Tweakable variales
wheelBase = 40;
steerAngle = 12;
enginePower = 800;
brakingStrength = 450
maxReverseSpeed = 20;

terrainFriction = .98;
airFriction = 0.001;

// Internal flag collection variables
team = 0;
color = c_red;
points = 0;

// Internal race variables
acceleration = 0;
steerAmount = 0;
velocity = 0;

lobbyLogic = function() {
}

gameplayLogic = function() {
	
	var _dt = delta_time*0.000001
	var _input = rollback_get_input(player_id);

	// Handle input
	var _steeringInput = _input.right - _input.left;
	steerAmount = steerAngle * _steeringInput;
	var _movingInput = _input.forward - _input.braking;
	acceleration = enginePower * _movingInput;


	// Apply forces
	if (velocity < .01) velocity = 0;

	var _frictionForce = -terrainFriction * velocity;
	var _dragForce = -airFriction * velocity * velocity;
	acceleration += _frictionForce + _dragForce;

	velocity += acceleration * _dt;

	// Handle the actual steering computation
	var _wheelBaseHalf = wheelBase * .5;

	var _dirCos = dcos(direction);
	var _dirSin = dsin(direction);

	var _xWheelOffset = _wheelBaseHalf * _dirCos;
	var _yWheelOffset = _wheelBaseHalf * _dirSin;

	var _frontWheelX = x + _xWheelOffset;
	var _frontWheelY = y + _yWheelOffset;

	var _backWheelX = x - _xWheelOffset;
	var _backWheelY = y - _yWheelOffset;

	_backWheelX += velocity * _dt * _dirCos;
	_backWheelY += velocity * _dt * _dirSin;

	_frontWheelX += velocity * _dt * dcos(direction + steerAmount);
	_frontWheelY += velocity * _dt * dsin(direction + steerAmount);

	var _newX = (_frontWheelX + _backWheelX) / 2;
	var _newY = (_frontWheelY + _backWheelY) / 2;

	// COLLISION HANDLING
	var hspd = _newX - x;
	var _sign = sign(hspd);
	if (place_meeting(x + hspd, y, obj_tire_wall)) {
		while (!place_meeting(x + _sign, y, obj_tire_wall)) {
			x += _sign;
		}
		hspd = 0;
	}
	else x = _newX;


	var vspd = _newY - y;
	_sign = sign(vspd);
	if (place_meeting(x, y + _sign,  obj_tire_wall)) {
		while (!place_meeting(x, y + _sign, obj_tire_wall)) {
			y += _sign;
		}
		vspd = 0;
	}
	else y = _newY;


	direction = darctan2(_frontWheelY - _backWheelY, _frontWheelX - _backWheelX);
	image_angle = -direction;

}

gameoverLogic = function() {
}


