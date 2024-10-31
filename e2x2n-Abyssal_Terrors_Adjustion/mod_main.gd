extends Node

const MOD_DIR := "e2x2n-Abyssal_Terrors_Adjustion/"
const LOG_NAME := "e2x2n-Abyssal_Terrors_Adjustion:Main"

var dir = ""
var content_dir = ""
var content_data_dir = ""
var ext_dir = ""
var trans_dir = ""


func _init(modLoader = ModLoader):
	ModLoaderUtils.log_info("Init",  LOG_NAME)
	dir = modLoader.UNPACKED_DIR + MOD_DIR
	trans_dir = dir + "translations/"
	content_dir = dir + "content/"
	content_data_dir = dir + "content_data/"
	ext_dir = dir + "extensions/"
	modLoader.add_translation_from_resource("res://mods-unpacked/e2x2n-Abyssal_Terrors_Adjustion/translations/translations.en.translation")
	modLoader.add_translation_from_resource("res://mods-unpacked/e2x2n-Abyssal_Terrors_Adjustion/translations/translations.zh.translation")

func _ready():
	ModLoaderUtils.log_info("Done",  LOG_NAME)

	var ContentLoader = get_node("/root/ModLoader/Darkly77-ContentLoader/ContentLoader")

	ContentLoader.load_data("res://mods-unpacked/e2x2n-Abyssal_Terrors_Adjustion/content_data/new_resource.tres", LOG_NAME)
