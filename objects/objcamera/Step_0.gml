/// @description Insert description here
// You can write your code in this editor

if (follow == undefined) return;

var _x = follow.x - RES.W *.5;
var _y = follow.y - RES.H *.5;

x = lerp(x, _x, camLerp);
y = lerp(y, _y, camLerp);

x = clamp(x, 0, room_width - RES.W);
y = clamp(y, 0, room_height - RES.H);

camera_set_view_pos(view_camera[0], x, y);







