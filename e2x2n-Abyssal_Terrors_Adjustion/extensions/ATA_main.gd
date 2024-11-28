extends "res://main.gd"


func on_consumable_picked_up(consumable: Node, player_index: int)->void :
	if Utils == null:
		return
	
	.on_consumable_picked_up(consumable, player_index)
	
	var consumable_count = RunData.players_data[player_index].consumables_picked_up_this_run
	
	var gain_stat_when_pick_up_consumable_effects = RunData.get_player_effect("gain_stat_when_pick_up_consumable", player_index)
	for effect in gain_stat_when_pick_up_consumable_effects:
		var stat_name = effect[0]
		var stat_value = 1
		var effect_pick_up_count = effect[1]
		if consumable_count % effect_pick_up_count == 0:
			RunData.add_stat(stat_name, stat_value, player_index)
