/// @description Insert description here
// You can write your code in this editor

y = room_height/2;

image_xscale = .2
image_yscale = .2

if (player_id == 0) x = 100;
else if (player_id == 1) x = room_width - 100;

steerAngle = 2;
steerAngleDrift = 4;

velocity = 0;
velocityMax = 5;
velocityMaxReverse = 2;

//
acceleration = 0.25;
deceleration = 0.3;
dampling = 0; // used for terrain