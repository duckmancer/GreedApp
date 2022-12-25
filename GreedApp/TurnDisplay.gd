extends Label

var round_num = 1
var player_turn = true

func update_display():
	var new_text = "Round "
	new_text += String(round_num)
	new_text += " - "
	if player_turn:
		new_text += "Player"
	else:
		new_text += "Enemy"
	new_text += " Turn"
	text = new_text
	

func _ready() -> void:
	pass


func update_turn():
	if player_turn:
		player_turn = false
	else:
		player_turn = true
		round_num += 1
	update_display()

func update_sensitive_elements():
	get_tree().call_group("turn_sensitive", "on_turn_end")

func _on_Button_pressed() -> void:
	update_turn()
	update_sensitive_elements()
