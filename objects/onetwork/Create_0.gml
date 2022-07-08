/// @description Insert description here
// You can write your code in this editor

rollback_define_player(oPlayer);

rollback_define_input({
	forward:[ord("W"), vk_up],
	left:[ord("A"), vk_left],
	right:[ord("D"), vk_right],
	braking: vk_space,
});

if (!rollback_join_game()) {
	rollback_create_game(2, true);
}

global.numberOfCaughtFlags = 0;

