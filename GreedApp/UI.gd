extends Control

onready var item_list := $ItemList
onready var tree := $Tree

var items = ["Passive", "Primary", "Secondary", "Special"]
var tooltips = ["Always active", "Once per turn", "Once per turn", "Once per battle"]

func _ready() -> void:
	var root = tree.create_item()
	tree.set_hide_root(true)
	for i in items.size():
		var category = tree.create_item()
		category.set_text(0, items[i])
		var child = tree.create_item(category)
		child.set_text(0, tooltips[i])
		
		
