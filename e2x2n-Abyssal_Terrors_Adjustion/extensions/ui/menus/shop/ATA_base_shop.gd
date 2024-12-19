extends "res://ui/menus/shop/base_shop.gd"

func buy_item(item_data: ItemData, player_index: int)->void :
	if Utils == null:
		return
		
	.buy_item(item_data, player_index)
	
	var player_gear_container = _get_gear_container(player_index)
	player_gear_container.set_items_data(RunData.get_player_items(player_index))
