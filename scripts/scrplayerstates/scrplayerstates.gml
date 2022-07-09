
function waitUpdate() {}

function lobbyUpdate() {}

function gameplayUpdate() {
	
	var _input = rollback_get_input(player_id);

	applyTerrainStats();

	accelerationX = 0;
	accelerationY = 0;
	
	directionX = dcos(direction);
	directionY = dsin(direction);

	handleInput(_input);

	applyFriction();

	applySteering(_input);

	velocityX += accelerationX;
	velocityY += accelerationY;
	
	handleCollision();
	
	x += velocityX;
	y += velocityY;
	
	handleStuck();
	
	if (global.playerId == player_id) {
		updateSounds(_input);
	}

}

function statsUpdate() {}