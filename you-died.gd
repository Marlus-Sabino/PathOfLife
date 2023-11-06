extends Node


func change_scene_to_interface():
	get_tree().change_scene_to_file("res://interface.tscn")

func _on_new_life_button_pressed():
	Global.energy = 100
	Global.AgeNumber = 0
	Global.health = 100
	Global.happiness = 100
	Global.charisma = randi_range(0, 100)
	Global.intelligence = randi_range(0, 100)
	Global.appearance = randi_range(0, 100)
	Global.stress = 0
	change_scene_to_interface()

func _on_revive_button_pressed():
	change_scene_to_interface()
