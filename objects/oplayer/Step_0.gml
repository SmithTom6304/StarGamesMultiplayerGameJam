/// @description Insert description here
// You can write your code in this editor

var _input = rollback_get_input(player_id);
var _driveInput = _input.forward - _input.reverse;

speed += _driveInput * acceleration;

if (_driveInput != 0) {

}


if (_driveInput) {
	speed = min(speed, velocityMax);
}
else {
	
	if (_breaking) speed = deceleration; // this allows 1 drift frame
	else speed -= deceleration;
	
	speed = max(speed, 0);
}

if (speed > 0) {
	var _steerInput = _input.right - _input.left;
	direction -= (_breaking ? steerAngleDrift : steerAngle) * _steerInput;

	image_angle = direction;
}
