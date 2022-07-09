/// @description Insert description here
// You can write your code in this editor

switch (room) {
	case rm_lobby:
	
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
	
		timer = time_source_create(time_source_game, 4, time_source_units_seconds, function() {
			room_goto(rm_level);
			//time_source_destroy(timer);
		});
		time_source_start(timer);
		break;
	
	case rm_level:
		global.numberOfCaughtFlags = 0;
		global.terrainLayer = layer_tilemap_get_id("TerrainStats");
		timer = time_source_create(time_source_game, 10, time_source_units_seconds, function() {
			room_goto(rm_stats);
			//time_source_destroy(timer);
		});
		time_source_start(timer);
		break;
		
	case rm_stats:
		timer = time_source_create(time_source_game, 4, time_source_units_seconds, function() {
			game_end();
			//time_source_destroy(timer);
		});
		time_source_start(timer);
}

