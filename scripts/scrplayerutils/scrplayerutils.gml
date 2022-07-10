

function getPlayerTeam(_playerId) {
	return global.playerToTeam[_playerId];
}

function getPlayerInitLocation(_playerId) {
	return global.playerLocations[player_id];
}

function getTeamColor(_teamId) {
	return global.teamToColor[_teamId];
}

function getTeamSprite(_teamId) {
	return global.teamToSprite[_teamId];
}

function setPlayerReady(_playerId) {
	global.playerReady[_playerId] = true;
}