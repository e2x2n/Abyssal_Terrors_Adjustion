class_name GainStatEveryConsumableEffect
extends NullEffect

export (String) var stat = ""
export (int) var stat_nb = 1

static func get_id()->String:
	return "item_gain_stat_every_consumable"

func get_args(_player_index: int)->Array:
	return [str(stat_nb), tr(stat.to_upper()), str(value)]

func serialize()->Dictionary:
	var serialized = .serialize()

	serialized.stat = stat
	serialized.stat_nb = stat_nb

	return serialized

func deserialize_and_merge(serialized: Dictionary)->void :
	.deserialize_and_merge(serialized)

	stat = serialized.stat
	stat_nb = serialized.stat_nb as int
