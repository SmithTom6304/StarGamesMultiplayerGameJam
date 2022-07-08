/// @description Insert description here
// You can write your code in this editor

rollback_define_player(oPlayer);

rollback_define_input({
	up:[ord("W"), vk_up],
	down:[ord("S"), vk_down],
	left:[ord("A"), vk_left],
	right:[ord("D"), vk_right],
});

if (!rollback_join_game()) {
	rollback_create_game(2, true);
}

