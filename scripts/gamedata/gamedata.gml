
global.audioController = undefined;

global.carSound = undefined;

global.playerToTeam = [ 0, 0, 1, 1 ];
global.teamToColor = [ c_red, c_blue ];

global.playerToSprite = [ 
	spr_car_endurance_red, 
	spr_car_endurance_red, 
	spr_car_endurance_blue,
	spr_car_endurance_blue
];

global.gameControls = {
	
	// Driving Controls
	forward:	[ ord("W"),	vk_up ],
	left:		[ ord("A"),	vk_left ],
	right:		[ ord("D"),	vk_right ],
	braking:	[ vk_space ],
	
}

global.rollbackInitialized = false;

global.playerPoints = [0, 0, 0, 0];

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
	{ frictionAmount: -.2, dragAmount: -0.05, steerAngle: 15 },
	// Grass
	{ frictionAmount: -.12, dragAmount: -0.008, steerAngle: 10 },
	// Track
	{ frictionAmount: -.08, dragAmount: -0.0015, steerAngle: 12 },
]