


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
		global.playerReverseBonus[player_id] = false;
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

	if (_velocityLength < .2)
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
		if (_velocityLength > 14) {
			isDrifting = true;
		} 
		else {
			if (wasDrifting) {
				wasDrifting = false;
				global.playerDrifts[player_id] += 1;
			}
		}
		
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
		velocityX = _newHeadingX * -min(_velocityLength, maxReverseSpeed);	
		velocityY = _newHeadingY * -min(_velocityLength, maxReverseSpeed);	
	}

	image_angle = point_direction(0, 0, _newHeadingX, _newHeadingY);
	direction = -image_angle;
}

function handleCollision() {
	
	if (place_meeting(x + velocityX, y, objCollision)) {
		global.playerCollideBonus[player_id] = false;
		while (abs(velocityX) > .1) {
			velocityX *= .5;
			if (!place_meeting(x + velocityX, y, objCollision)) {
				x += velocityX;
			}
		}
		velocityX = 0;
	}

	if (place_meeting(x, y + velocityY, objCollision)) {
		global.playerCollideBonus[player_id] = false;
		while (abs(velocityY) > .1) {
			velocityY *= .5;
			if (!place_meeting(x, y + velocityY, objCollision)) {
				y += velocityY;
			}
		}
		velocityY = 0;
	}
}

function handleStuck() {
	
	if (positionX == x && positionY == y) {
		stuckCount += 1;
	}
	else {
		positionX = x;
		positionY = y;
		stuckCount = 0;
	}
	
	if (stuckCount >= 120) {
		
		var _location = getPlayerInitLocation(player_id);

		if (x == _location.x && y == _location.y) return;

		x = _location.x;
		y = _location.y;

		alarm[0] = 120;
		image_speed = 1;
		stuckCount = 0;
	}

}

function updateSounds(_input) {
	
	// Get terrain changes
	var _cellId = tilemap_get_at_pixel(global.terrainLayer, x, y);
	
	if (isDrifting) {
		audio_play_sound_on(audioEmitter, sndCarDrifting, false, 1);
		isDrifting = false;
		wasDrifting = true;
	}
	
	if (_input.forward) {
		
		var _shoudSwitch = false;
		var _carMoveSound = global.terrainToCarMoveSound[_cellId];
		if (_carMoveSound != global.carSoundAsset) {
			global.carSoundAsset = _carMoveSound;
			_shoudSwitch = true;
		}
		
		if (_shoudSwitch || isIdled == false) {
			
			if (global.carSound != undefined) audio_stop_sound(global.carSound);
			global.carSound = audio_play_sound_on(audioEmitter, _carMoveSound, true, 1);
			isIdled = true;
		}
	}
	else {
		if (isIdled == true) {	
			if (global.carSound != undefined) audio_stop_sound(global.carSound);
			global.carSound = audio_play_sound_on(audioEmitter, sndCarIdle, true, 1);
			isIdled = false;
		}
	}
	
}
