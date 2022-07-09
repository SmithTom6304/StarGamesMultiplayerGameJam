

function applyTerrainStats() {
	
	// Get terrain changes
	_cellId = tilemap_get_at_pixel(global.terrainLayer, x, y);
	var _data = global.terrainStats[_cellId];
	
	steerAngle = _data.steerAngle;
	frictionAmount = _data.frictionAmount;
	dragAmount = _data.dragAmount;
}

function handleInput(_input) {
	
	steerDirection = _input.left - _input.right;
	if (_input.forward)
	{
		accelerationX = directionX * enginePower;
		accelerationY = directionY * enginePower
	}
	if (_input.braking)
	{
		accelerationX += directionX * brakingPower;
		accelerationY += directionY * brakingPower
	}
		
}

function applyFriction() {

	var _velocityLength = point_distance(0, 0, velocityX, velocityY);

	if (_velocityLength < .02) 
	{ 
		velocityX = 0;
		velocityY = 0;
	}
	
	var _frictionForceX = velocityX * frictionAmount;
	var _frictionForceY = velocityY * frictionAmount;
	var _dragForceX = velocityX * _velocityLength * dragAmount;
	var _dragForceY = velocityY * _velocityLength * dragAmount;
	
	accelerationX += _frictionForceX + _dragForceX;
	accelerationY += _frictionForceY + _dragForceY;
	
}

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
		var _newAngle = _velocityAngle - (steerDirection * steerAngle * .9);
		var _rotatedVelX = lengthdir_x(_velocityLength, _newAngle);
		var _rotatedVelY = lengthdir_y(_velocityLength, _newAngle);
		
		_rearWheelX += _rotatedVelX;
		_rearWheelY += _rotatedVelY;
	}
	
	// Front Wheels
	var _newAngle = _velocityAngle + (steerDirection * steerAngle);
	var _rotatedVelX = lengthdir_x(_velocityLength, _newAngle);
	var _rotatedVelY = lengthdir_y(_velocityLength, _newAngle);
		
	_frontWheelX += _rotatedVelX;
	_frontWheelY += _rotatedVelY;
	
	// New heading
	var _newHeadingX = _frontWheelX - _rearWheelX
	var _newHeadingY = _frontWheelY - _rearWheelY

	// Normalize new heading
	var _newHeadingAngle = point_direction(0, 0, _newHeadingX, _newHeadingY);
	_newHeadingX = lengthdir_x(1, _newHeadingAngle);
	_newHeadingY = lengthdir_y(1, _newHeadingAngle);
	
	// Reverse
	var _isReverse =  dot_product(_newHeadingX, _newHeadingY, lengthdir_x(1, _velocityAngle), lengthdir_y(1, _velocityAngle))
	if (_isReverse > 0)
	{
		velocityX = _newHeadingX * _velocityLength;
		velocityY = _newHeadingY * _velocityLength;
	}
	if (_isReverse < 0)
	{
		show_debug_message("REVERSE")
		velocityX = _newHeadingX * -min(_velocityLength, maxReverseSpeed);	
		velocityY = _newHeadingY * -min(_velocityLength, maxReverseSpeed);	
	}

	image_angle = point_direction(0, 0, _newHeadingX, _newHeadingY);
	direction = -image_angle;
}

function handleCollision() {
	
	if (place_meeting(x + velocityX, y, obj_collision)) {
		while (abs(velocityX) > .1) {
			velocityX *= .5;
			if (!place_meeting(x + velocityX, y, obj_collision)) {
				x += velocityX;
			}
		}
		velocityX = 0;
	}

	if (place_meeting(x, y + velocityY, obj_collision)) {
		while (abs(velocityY) > .1) {
			velocityY *= .5;
			if (!place_meeting(x, y + velocityY, obj_collision)) {
				y += velocityY;
			}
		}
		velocityY = 0;
	}
}

function handleStuck() {
	
	if (!place_meeting(x, y, obj_collision)) {
		safeX = x;
		safeY = y;
	}
	else {
		x = safeX;
		y = safeY;
	}
}

function updateSounds(_input) {
		
	if (_input.forward) { 
		if (isIdled == false) {
			if (global.carSound) audio_stop_sound(global.carSound);
			global.carSound = audio_play_sound_on(audioEmitter, SFX_endurance_car_loop_v1, true, 1);
			isIdled = true;
		}
	}
	else {
		if (isIdled == true) {	
			if (global.carSound) audio_stop_sound(global.carSound);
			global.carSound = audio_play_sound_on(audioEmitter, SFX_endurance_car_idle_v1, true, 1);
			isIdled = false;
		}
	}
	
}
