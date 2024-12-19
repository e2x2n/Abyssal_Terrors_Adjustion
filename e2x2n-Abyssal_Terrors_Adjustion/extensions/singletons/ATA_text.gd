extends "res://singletons/text.gd"

const DISEASE_COLOR = Color("a4e414")

func text(key: String, args: Array = [], arg_signs: Array = []) -> String:
	if Utils == null:
		return ""

	var result_text = .text(key, args, arg_signs)


	if key.to_lower().find("disease") != -1:
		result_text = result_text.replace("[color=#" + Utils.CURSE_COLOR.to_html() + "]", "[color=#" + DISEASE_COLOR.to_html() + "]")

	return result_text
