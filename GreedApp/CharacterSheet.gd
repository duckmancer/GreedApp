extends Control

onready var hp_display = $Panel/HPDisplay

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
	
func apply_hp_input(new_text := ""):
	hp_display.clear()
	hp_display.release_focus()
	if '/' in new_text:
		var splits = new_text.split('/', false)
		if splits.size() >= 2:
			new_text = splits[0]
			set_max_hp(int(splits[1]))
	var new_hp = int(new_text)
	if '+' in new_text or '-' in new_text:
		new_hp = hp + new_hp
	if new_hp != 0 or '0' in new_text:
		set_hp(new_hp)
	else:
		update_hp_display()

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


func _on_HPDisplay_text_entered(new_text: String) -> void:
	apply_hp_input(new_text)


func _on_HPDisplay_focus_entered() -> void:
	hp_display.clear()


func _on_HPDisplay_focus_exited() -> void:
	apply_hp_input(hp_display.text)
