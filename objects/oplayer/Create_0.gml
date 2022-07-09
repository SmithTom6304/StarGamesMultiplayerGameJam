/// @description Insert description here
// You can write your code in this editor

image_xscale = .8
image_yscale = .8

var _location = global.playerLocations[player_id];
x = _location.x;
y = _location.y;

// Tweakable variales
wheelBase = 40;
steerAngle = 12;
enginePower = 800;
brakingStrength = 450
maxReverseSpeed = 20;

terrainFriction = 0.9;
airFriction = 0.001;

// Internal flag collection variables
team = 0;
color = c_red;
points = 0;

// Internal race variables
acceleration = 0;
steerAmount = 0;
velocity = 0;


update = function() {};

// ### INTERNAL VARIABLES ###
accelerationX = 0;
accelerationY = 0;
directionX = 1;
directionY = 0;
velocityX = 0;
velocityY = 0;


#region METHODS

function handleInput() {}

function applyFriction() {}

function applySteering(_input) {

	var _wheelBaseHalf = wheelBase * .5;

	var _wheelOffsetX = directionX * _wheelBaseHalf;
	var _wheelOffsetY = directionY * _wheelBaseHalf;

	var _frontWheelX = x + _wheelOffsetX;
	var _frontWheelY = y + _wheelOffsetY;
	
	var _rearWheelX = x - _wheelOffsetX;
	var _rearWheelY = y - _wheelOffsetY;

	var _velocityAngle = point_direction(0, 0, velocityX, velocityY);
	var _velocityLength = point_distance(0, 0, velocityX, velocityY);

	// Rear Wheels
	if (!_input.braking)
	{
		_rearWheelX += velocityX;
		_rearWheelY += velocityY;
	}
	else
	{
		var _newAngle = _velocityAngle - steerDirection * steerAngle * .9;
		var _rotatedVelX = lengthdir_x(_velocityLength, _newAngle);
		var _rotatedVelY = lengthdir_y(_velocityLength, _newAngle);
		
		_rearWheelX += _rotatedVelX;
		_rearWheelY += _rotatedVelY;
	}
	
	// Front Wheels
	var _newAngle = _velocityAngle - steerDirection * steerAngle;
	var _rotatedVelX = lengthdir_x(_velocityLength, _newAngle);
	var _rotatedVelY = lengthdir_y(_velocityLength, _newAngle);
		
	_frontWheelX += _rotatedVelX;
	_frontWheelY += _rotatedVelY;
	
	var _newHeadingX = _frontWheelX - _rearWheelX
	var _newHeadingY = _frontWheelY - _rearWheelY

	// Normalize new heading
	var _newHeadingAngle = point_direction(0, 0, _newHeadingX, _newHeadingY);
	_newHeadingX = dcos(_newHeadingAngle);
	_newHeadingY = dsin(_newHeadingAngle);
	
	var _isReverse =  dot_product(_newHeadingX, _newHeadingY, dcos(_velocityAngle), dsin(_velocityAngle))
	if (_isReverse > 0)
	{
		velocityX = _newHeadingX * _velocityLength;
		velocityY = _newHeadingY * _velocityLength;
	}
	if (_isReverse < 0)
	{
		velocityX = _newHeadingX * -min(_velocityLength, maxReverseSpeed);	
		velocityY = _newHeadingY * -min(_velocityLength, maxReverseSpeed);	
	}

	image_angle = point_direction(0, 0, _newHeadingX, _newHeadingY);
	direction = -image_angle;

}

function handleCollision() {

	var hspd = _newX - x;
	var _sign = sign(hspd);
	if (place_meeting(x + hspd, y, obj_collision)) {
		while (!place_meeting(x + _sign, y, obj_collision)) {
			x += _sign;
		}
		hspd = 0;
	}
	else x = _newX;


	var vspd = _newY - y;
	_sign = sign(vspd);
	if (place_meeting(x, y + _sign,  obj_collision)) {
		while (!place_meeting(x, y + _sign, obj_collision)) {
			y += _sign;
		}
		vspd = 0;
	}
	else y = _newY;

}

#endregion


#region LOGIC


lobbyLogic = function() {
}

gameplayUpdate = function() {
	
	var _dt = delta_time*0.000001
	var _input = rollback_get_input(player_id);

	// Get terrain changes
	_cellId = tilemap_get_at_pixel(global.terrainLayer, x, y);
	var _data = global.terrainStats[_cellId];
	
	steerAngle = _data.steerAngle;
	terrainFriction = _data.terrainFriction;
	airFriction = _data.airFriction;

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
	if (place_meeting(x + hspd, y, obj_collision)) {
		while (!place_meeting(x + _sign, y, obj_collision)) {
			x += _sign;
		}
		hspd = 0;
	}
	else x = _newX;


	var vspd = _newY - y;
	_sign = sign(vspd);
	if (place_meeting(x, y + _sign,  obj_collision)) {
		while (!place_meeting(x, y + _sign, obj_collision)) {
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


#endregion

switch (room) {

	case rm_level:
		update = gameplayUpdate;
		break;
	default:
		update = function() {};
}
