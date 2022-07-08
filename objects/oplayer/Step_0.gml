/// @description Insert description here
// You can write your code in this editor

var _input = rollback_get_input(player_id);

steerDirection = _input.right - _input.left;
velocity = Vector2();

if (_input.up) {
	velocity = Vector2Utils.fromPolar(10, direction);
}

var _position = new Vector2(x, y);
var _offset = Vector2Utils.fromPolar(1, wheelDistance/2);
var rearWheels = _position.subtract(_offset);
var frontWheels = _position.add(_offset);







