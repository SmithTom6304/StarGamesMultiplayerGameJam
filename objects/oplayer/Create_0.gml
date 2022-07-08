/// @description Insert description here
// You can write your code in this editor

_dot = 0;

y = room_height/2;

image_xscale = .2
image_yscale = .2

if (player_id == 0) x = 200;
else if (player_id == 1) x = room_width - 200;

// Tweakable variales
wheelBase = 40;
steerAngle = 12;
enginePower = 800;
brakingStrength = 450
maxReverseSpeed = 20;

terrainFriction = .90;
airFriction = 0.001;

// Internal variables
acceleration = 0;
steerAmount = 0;
velocity = 0;