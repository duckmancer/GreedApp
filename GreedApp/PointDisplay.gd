extends LineEdit

export var base_label := ""

export var max_val := 0 setget set_max_val
export var cur_val := 0 setget set_cur_val
export var capped := true

func update_stat_display():
	var label = base_label
	label += String(cur_val)
	label += "/"
	label += String(max_val)
	text = label
	
func apply_stat_input(new_text := ""):
	clear()
	release_focus()
	if '/' in new_text:
		var splits = new_text.split('/', false)
		if splits.size() >= 2:
			new_text = splits[0]
			set_max_val(int(splits[1]))
	var new_val = int(new_text)
	if '+' in new_text or '-' in new_text:
		new_val = cur_val + new_val
	if new_val != 0 or '0' in new_text:
		set_cur_val(new_val)
	else:
		update_stat_display()

func set_cur_val(new_val):
	cur_val = new_val
	if capped:
# warning-ignore:narrowing_conversion
		cur_val = min(max_val, new_val)
# warning-ignore:narrowing_conversion
	cur_val = max(0, cur_val)
	update_stat_display()
	
func set_max_val(new_max_val):
	max_val = new_max_val
	update_stat_display()

func _ready() -> void:
	update_stat_display()


func _on_StatDisplay_text_entered(new_text: String) -> void:
	apply_stat_input(new_text)


func _on_StatDisplay_focus_entered() -> void:
	clear()


func _on_StatDisplay_focus_exited() -> void:
	apply_stat_input(text)
