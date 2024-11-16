extends "res://singletons/player_run_data.gd"
	

static func init_stats(all_null_values:bool = false)->Dictionary:
	if Utils == null:
		return {}
	return .init_stats(all_null_values)

static func init_effects() -> Dictionary:
	if Utils == null:
		return {}

	var vanilla_effects = .init_effects()

	var new_effects: = {
		"temp_items": []
	}

	new_effects.merge(vanilla_effects)

	return new_effects;
