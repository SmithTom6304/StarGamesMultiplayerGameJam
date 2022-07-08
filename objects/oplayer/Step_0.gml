/// @description Insert description here
// You can write your code in this editor

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

x = (_frontWheelX + _backWheelX) / 2;
y = (_frontWheelY + _backWheelY) / 2;

direction = darctan2(_frontWheelY - _backWheelY, _frontWheelX - _backWheelX);
image_angle = -direction;