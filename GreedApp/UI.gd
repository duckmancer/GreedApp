extends Control

onready var item_list = $ItemList

var items = ["Passive", "Primary", "Secondary", "Special"]

func _ready() -> void:
	for i in items:
		item_list.add_item(i);
