extends "res://singletons/run_data.gd"


func on_wave_start()->void :
	if Utils == null:
		return

	.on_wave_start()
	
	for player_index in RunData.get_player_count():
		var disease_stat = Utils.get_stat("stat_disease", player_index)
		if (disease_stat >= 100) :
			.apply_end_run()

func on_wave_end()->void :
	if Utils == null:
		return
	
	.on_wave_end()
	
	for player_index in RunData.get_player_count():
		process_temporary_effects(player_index)
		
		var disease_stat = Utils.get_stat("stat_disease", player_index)
		var disease_growth = RunData.get_player_effect("disease_growth", player_index)
		
		var val = ceil(disease_stat * (disease_growth / 100.0))
		RunData.add_stat("stat_disease", val, player_index)


func process_temporary_effects(player_index: int) -> void:
	var player_temp_items: Array = RunData.get_player_effect("temp_items", player_index)

	for player_temp_item in player_temp_items.duplicate():
		var source_item = null

		for player_item in RunData.get_player_items(player_index):
			if player_item.my_id == player_temp_item[0]:
				for effect in player_item.effects:
					if effect.custom_key == "temp_items" and effect.value == player_temp_item[1]:
						source_item = player_item
						break

				if source_item:
					RunData.remove_item(source_item, player_index, true)
					player_temp_items.erase(player_temp_item)
				break


func remove_item(item: ItemData, player_index: int, by_id: bool = false)->void :
	for i in players_data[player_index].items.size():
		var cond = ItemService.is_same_item(item, players_data[player_index].items[i])

		if by_id:
			cond = item.my_id == players_data[player_index].items[i].my_id

		if cond:
			players_data[player_index].items.erase(players_data[player_index].items[i])
			break

	unapply_item_effects(item, player_index)
	remove_item_displayed(item, player_index)
	update_item_related_effects(player_index)
	LinkedStats.reset_player(player_index)

	if item.replaced_by:
		if item.is_cursed:
			var dlc = ProgressData.get_dlc_data("abyssal_terrors")
			add_item(dlc.curse_item(item.replaced_by, player_index), player_index)
		else:
			add_item(item.replaced_by, player_index)


func add_item(item: ItemData, player_index: int)->void :

	
	randomize()
	var random_integer = randi() % 4 + 1
	var random_relic_id = "ATA_item_relic_" + str(random_integer)
	
	var chest = item;
	if (chest.my_id == "ATA_item_relic_chest") :
		item = ItemService.get_element(ItemService.items, random_relic_id)
		
		if chest.is_cursed :
			var dlc = ProgressData.get_dlc_data("abyssal_terrors")
			item = dlc.curse_item(item, player_index)
	
	.add_item(item, player_index)
	
func add_starting_items_and_weapons()->void :
	if Utils == null:
		return
		
	.add_starting_items_and_weapons()
	
	for player_index in players_data.size():
		var item = ItemService.get_element(ItemService.items, "ATA_item_disease")
		add_item(item, player_index)	
