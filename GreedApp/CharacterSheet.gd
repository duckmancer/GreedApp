extends Control

onready var hp_display = $Panel/HPDisplay
onready var hp_input = $Panel/HPInput

var hp = 0 setget set_hp
var max_hp = 0 setget set_max_hp
var mana = 0
var power = 0
var defense = 0

func update_hp_display():
	var label = "HP: "
	label += String(hp)
	label += "/"
	label += String(max_hp)
	hp_display.text = label

func set_hp(new_hp):
	hp = min(max_hp, new_hp)
	hp = max(0, hp)
	update_hp_display()
	
func set_max_hp(new_max_hp):
	max_hp = new_max_hp
	update_hp_display()

func _ready() -> void:
	set_max_hp(20)
	set_hp(max_hp)


func _on_LineEdit_text_entered(new_text: String) -> void:
	hp_input.clear()
	var new_hp = int(new_text)
	if '+' in new_text or '-' in new_text:
		new_hp = hp + new_hp
	if new_hp != 0 or '0' in new_text:
		set_hp(new_hp)
