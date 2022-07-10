

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

function calculatePoints() {

	var _driftMax = -1, _driftWinner = -1;
	for (var _i = 0; _i < 4; _i++) {
	
		global.playerPoints[_i] = global.playerFlagsCollected[_i] * 1;
		global.playerPoints[_i] += global.playerFlagsStolen[_i] * 2;

		if (global.playerFirstFlag[_i])
			global.playerPoints[_i] += 8;

		if (global.playerReverseBonus[_i])
			global.playerPoints[_i] += 6;
			
		if (global.playerCollideBonus[_i])
			global.playerPoints[_i] += 6;
	
	}

	var _teamA = global.playerFirstFlag[0] || global.playerFirstFlag[1];
	var _teamB = global.playerFirstFlag[2] || global.playerFirstFlag[3];
	global.teamFirstFlag = [_teamA, _teamB]

	var _teamA = global.playerDrifts[0] + global.playerDrifts[1];
	var _teamB = global.playerDrifts[2] + global.playerDrifts[3];
	global.teamDriftCount = [_teamA, _teamB ];
	global.teamDriftBonus = [ _teamA > _teamB, _teamB > _teamA ];
	
	global.teamPoints[0] = global.playerPoints[0] + global.playerPoints[1];
	global.teamPoints[1] = global.playerPoints[2] + global.playerPoints[3];
	
	global.teamPoints[0] += global.teamDriftBonus[0] * 3;
	global.teamPoints[1] += global.teamDriftBonus[1] * 3;

	var _teamA = 0, _teamB = 0;
	with(objFlag) {
		if (team == 0) _teamA += 1;
		if (team == 1) _teamB += 1;
	}
	
	var _moreFlags = [0, 0]
	if (_teamA > _teamB) _moreFlags[0] = 1;
	else if (_teamA < _teamB) _moreFlags[1] = 1;

	global.teamPoints[0] += _moreFlags[0] * 10;
	global.teamPoints[1] += _moreFlags[1] * 10;
	global.teamMoreFlags = _moreFlags

	if (global.teamPoints[0] > global.teamPoints[1]) global.winningTeam = 0;
	if (global.teamPoints[1] > global.teamPoints[0]) global.winningTeam = 1;
	else global.winningTeam = (global.playerFirstFlag[0] | global.playerFirstFlag[1]) ? 0 : 1;
}