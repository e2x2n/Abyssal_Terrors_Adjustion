extends Node

const MOD_DIR = "e2x2n-Abyssal_Terrors_Adjustion/"
const LOG_NAME = "e2x2n-Abyssal_Terrors_Adjustion"

var dir = ""
var content_dir = ""
var ext_dir = ""
var trans_dir = ""

var custom_items = []
var custom_characters = []
var custom_weapons = []
var custom_challenges = []


func _init():
	ModLoaderLog.info("Initializing Abyssal Terrors Adjustion", LOG_NAME)
	
	dir = ModLoaderMod.get_unpacked_dir() + MOD_DIR
	ext_dir = dir + "extensions/"
	trans_dir = dir + "translations/"
	content_dir = dir + "content/"

	var extensions = [
	"singletons/ATA_run_data.gd",
	"singletons/ATA_player_run_data.gd"
	]
	for path in extensions:
		ModLoaderMod.install_script_extension(ext_dir + path)
	
	ModLoaderMod.add_translation("res://mods-unpacked/e2x2n-Abyssal_Terrors_Adjustion/translations/translations.en.translation")
	ModLoaderMod.add_translation("res://mods-unpacked/e2x2n-Abyssal_Terrors_Adjustion/translations/translations.zh.translation")


func _ready():
	ModLoaderLog.info("Loading Abyssal Terrors Adjustion Content", LOG_NAME)

	var ata_data = load(dir + "ATA_data.tres")

	if ata_data:
		_add_mod_data(ata_data)
		_install_data()
		ModLoaderLog.info("Content loaded for Abyssal Terrors Adjustion", LOG_NAME)
	else:
		ModLoaderLog.error("Failed to load ATA_data.tres", LOG_NAME)


func _add_mod_data(mod_data):
	custom_items.append_array(mod_data.items)
	custom_characters.append_array(mod_data.characters)
	custom_weapons.append_array(mod_data.weapons)
	custom_challenges.append_array(mod_data.challenges)


func _install_data():
	ItemService.items.append_array(custom_items)
	ItemService.characters.append_array(custom_characters)
	ItemService.weapons.append_array(custom_weapons)
	ChallengeService.challenges.append_array(custom_challenges)

	ModLoaderLog.info("Installed content for Abyssal Terrors Adjustion", LOG_NAME)
