
global.playerLocations = 
[
	{ x: 2045, y: 1000 },
	{ x: 5625, y: 4044 },
	{ x: 841,  y: 2709 },
	{ x: 7025, y: 2323 },
]

global.terrainLayer = undefined;

global.terrainStats = 
[
	undefined,
	// Sand
	{ terrainFriction: 1.20, airFriction: 0.05, steerAngle: 15 },
	// Grass
	{ terrainFriction: 1.0, airFriction: 0.008, steerAngle: 10 },
	// Track
	{ terrainFriction: .98, airFriction: 0.001, steerAngle: 12 },
]