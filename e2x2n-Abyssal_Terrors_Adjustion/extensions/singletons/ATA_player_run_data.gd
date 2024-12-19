extends "res://singletons/player_run_data.gd"
	

static func init_stats(all_null_values:bool = false)->Dictionary:
	if Utils == null:
		return {}
	var vanilla_stats = .init_stats(all_null_values)
	
	var new_stats: = {
	}
	
	new_stats.merge(vanilla_stats)
	
	return new_stats;

static func init_effects() -> Dictionary:
	if Utils == null:
		return {}

	var vanilla_effects = .init_effects()

	var new_effects: = {
		"temp_items": [],
		"gain_stat_when_pick_up_consumable": [],
		"disease_growth": 3
	}

	new_effects.merge(vanilla_effects)

	return new_effects;
