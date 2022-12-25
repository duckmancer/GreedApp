extends Label

export var stat_label := ""

onready var menu_button := $MenuButton

var stat_val := 0

var turn_mods := 0
var round_mods := 0
var battle_mods := 0

var modifier_options = [
	"+1 Turn",
	"-1 Turn",
	"+1 Round",
	"-1 Round",
	"+1 Battle",
	"-1 Battle",
]

func update_stat_val():
	stat_val = turn_mods + round_mods + battle_mods
	text = stat_label + ": " + String(stat_val)

func _ready() -> void:
	var popup = menu_button.get_popup()
	for option in modifier_options:
		popup.add_item(option)
	popup.add_font_override("font", preload("res://RobotoFont.tres"))
	popup.connect("id_pressed", self, "_on_popup_id_pressed")
	
	update_stat_val()


func _on_popup_id_pressed(id):
	if id == 0:
		turn_mods += 1
	if id == 1:
		turn_mods -= 1
	if id == 2:
		round_mods += 1
	if id == 3:
		round_mods -= 1
	if id == 4:
		battle_mods += 1
	if id == 5:
		battle_mods -= 1
	update_stat_val()


func on_turn_end():
	turn_mods = round_mods
	round_mods = 0
	update_stat_val()
