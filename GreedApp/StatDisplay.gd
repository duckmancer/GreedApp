extends Label

export var stat_label := ""

onready var menu_button := $MenuButton

var stat_val := 0 setget set_stat_val

var modifier_options = [
	"+1 Turn",
	"+1 Round",
	"+1 Battle",
]

func set_stat_val(new_val):
	stat_val = new_val
	text = stat_label + ": " + String(stat_val)

func _ready() -> void:
	var popup = menu_button.get_popup()
	for option in modifier_options:
		popup.add_item(option)
	popup.add_font_override("font", preload("res://RobotoFont.tres"))
	popup.connect("id_pressed", self, "_on_popup_id_pressed")
	
	set_stat_val(stat_val)


func _on_popup_id_pressed(id):
	set_stat_val(stat_val + 1)
