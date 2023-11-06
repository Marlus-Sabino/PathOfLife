extends Node

@onready var NameLabel = $BasicInfoContainer/BasicInfoVBox/NameLabel
@onready var SexIdentityLabel = $BasicInfoContainer/BasicInfoVBox/SexIndentityLabel
@onready var AgeLabel = $BasicInfoContainer/BasicInfoVBox/Age_Label
@onready var OcuppationLabel = $BasicInfoContainer/BasicInfoVBox/OcupationLabel

@onready var AgeNumber = 0
@onready var energy = 100
@onready var healthrisk = 0.5

@onready var health = 100
@onready var happiness = 100
@onready var charisma = 100
@onready var intelligence = 100
@onready var appearance = 100
@onready var stress = 100
@onready var sexIdentity
@onready var profileName
@onready var profileSurname
@onready var skinColor = randi() %35
@onready var clothesColor = Color(randf(), randf(), randf())

#var random_event_panelContainer:PanelContainer
var random_event_panelContainer:Control
var activities_menu_panelContainer:Control
var activities_menu_Activity1:ScrollContainer
var activities_menu_Activity2:ScrollContainer
var activities_menu_Activity3:ScrollContainer
var activities_menu_Activity4:ScrollContainer
var activities_menu_Activity5:ScrollContainer
var choose_event_button_2:Sprite2D
var choose_event_button_1:Sprite2D
var choose_event_button_1_label:Button
var choose_event_button_2_label:Button
var coin_throw

var random_event_good_luck_toodler = [
	"\n\nThe toddler receives their favorite toy as a gift, bringing them joy and comfort.", 
	"\n\nThe toddler has a particularly sweet dream, having a pleasant long sleep.",
	"\n\nThe toddler successfully learns to use the potty, achieving a significant milestone with ease.",
	"\n\nThe toddler is surrounded by caring and nurturing caregivers who provide a supportive and stimulating environment.",
	"\n\nThe toddler remains in excellent health, experiencing minimal illnesses or medical issues.",
	"\n\nThe toddler enjoys exceptional health, rarely encountering any illnesses or medical concerns.",
	"\n\nThe toddler becomes part of a supportive community, where neighbors and friends offer help and encouragement.",
	"\n\nEveryone wanted to play with you in the park and you make lots of friends."
]
var random_event_good_luck_title_toodler = [
	"Favorite toy:", 
	"Sweet dream:",
	"Successful potty training:",
	"Loving caregivers:",
	"Excellent health:",
	"Excellent health:",
	"Supportive community:",
	"King of the Playground:"
]
var random_event_good_luck_bonnus_toodler = [
	"\nHappiness + 5",
	"\nHappiness + 5",
	"\nIntelligence + 5",
	"\nIntelligence + 5",
	"\nHealth + 5",
	"\nHealth + 5",
	"\nCharisma + 5",
	"\nCharisma + 5"
]
var random_event_bad_luck_title_toodler = [
	"Lost favorite toy", 
	"Unsettling dream:",
	"Unsuccessful potty training:",
	"Neglected environment:",
	"Poor health:",
	"Illness:",
	"Unsupportive community:",
	"Lonely at the Playground:"
]
var random_event_bad_luck_toodler = [
	"\n\nThe toddler misplaces or loses their favorite toy, causing distress and sadness.", 
	"\n\nThe toddler has a particularly unsettling or scary dream, causing nighttime fear and disrupted sleep.",
	"\n\nThe toddler struggles to learn to use the potty, facing challenges and not achieving the desired milestone easily.",
	"\n\nThe toddler lacks caring and nurturing caregivers, resulting in an unsupportive and unstimulating environment.",
	"\n\nThe toddler suffers from frequent illnesses and medical issues, experiencing ongoing health problems.",
	"\n\nThe toddler's health is consistently poor, frequently encountering various illnesses and medical concerns.",
	"\n\nThe toddler is isolated and lacks a supportive community, with neighbors and friends offering little to no help or encouragement.",
	"\n\nYou feel excluded and have difficulty making friends in the park, with limited interactions and a sense of isolation."
]
var random_event_bad_luck_bonnus_toodler = [
	"\nHappiness - 5",
	"\nHappiness - 5",
	"\nIntelligence - 5",
	"\nIntelligence - 5",
	"\nHealth - 5",
	"\nHealth - 5",
	"\nCharisma - 5",
	"\nCharisma - 5"
]

var choose_event_title_toodler = [
	"Early development:", 
	"Special talent:"
]
var choose_event_toodler = [
	"\n\nYou have exhibited exceptional early development. Choose an interesting you would like to boost:", 
	"\n\nThe toddler discovers a unique talent or interest at a young age, setting them on a path of early success and recognition:"
]
var choose_event_option_1_label_toodler = [
	"Art",
	"Sport"
]
var choose_event_option_2_label_toodler = [
	"Sport",
	"Art"
]

func choose_event_option_1_toodler():
	var random_event_number = Global.RandomEventNumber
	if choose_event_option_1_label_toodler[random_event_number] == "Art":
		appearance += 1
	elif choose_event_option_1_label_toodler[random_event_number] == "Sport":
		health += 1
func choose_event_option_2_toodler():
	var random_event_number = Global.RandomEventNumber
	if choose_event_option_2_label_toodler[random_event_number] == "Art":
		appearance += 1
	elif choose_event_option_2_label_toodler[random_event_number] == "Sport":
		health += 1
		
		#sexIdentity = "male"
		#Global.sexIdentity = sexIdentity

func name_male():
	var file
	var contents
	var randomIndex
	var names_option
	var surnames_option
	var path_name = "res://names_male.txt"
	var path_surname = "res://surnames.txt"
	
	file = FileAccess.open(path_name,FileAccess.READ)
	contents = file.get_as_text()
	file.close()
	names_option = contents.split("\n")
	file = FileAccess.open(path_surname,FileAccess.READ)
	contents = file.get_as_text()
	file.close()
	surnames_option = contents.split("\n")
	
	randomIndex = randi() % names_option.size()
	profileName = names_option[randomIndex]
	randomIndex = randi() % surnames_option.size()
	profileSurname = surnames_option[randomIndex]
	
	print(profileName)
	print(profileSurname)

func name_female():
	var file
	var contents
	var randomIndex
	var names_option
	var surnames_option
	var path_name = "res://names_female.txt"
	var path_surname = "res://surnames.txt"
	
	file = FileAccess.open(path_name,FileAccess.READ)
	contents = file.get_as_text()
	file.close()
	names_option = contents.split("\n")
	file = FileAccess.open(path_surname,FileAccess.READ)
	contents = file.get_as_text()
	file.close()
	surnames_option = contents.split("\n")
	
	randomIndex = randi() % names_option.size()
	profileName = names_option[randomIndex]
	randomIndex = randi() % surnames_option.size()
	profileSurname = surnames_option[randomIndex]
	
	print(profileName)
	print(profileSurname)

func SexIndentityCoin():
	luck_coin()
	if coin_throw<=0.5:
		sexIdentity = "male"
		name_male()
	else:
		name_female()
		sexIdentity = "female"
	Global.SexIdentity = sexIdentity
	Global.ProfileName = profileName.strip_edges()
	Global.ProfileSurname = profileSurname.strip_edges()
	print(sexIdentity)
	
func _ready():
	AgeNumber = Global.AgeNumber
	health = Global.health
	happiness = Global.happiness
	charisma = Global.charisma
	intelligence = Global.intelligence
	appearance = Global.appearance
	stress = Global.stress
	
	SexIndentityCoin()
	sexIdentity = Global.SexIdentity 
	profileName = Global.ProfileName
	profileSurname = Global.ProfileSurname
	
	var fullName = (profileName + " " + profileSurname).strip_edges()
	print(fullName)
	NameLabel.text = fullName
	SexIdentityLabel.text = sexIdentity
	OcuppationLabel.text = "baby"
	
	#random_event_panelContainer = $randomEventPanelContainer
	random_event_panelContainer = $Control
	random_event_panelContainer.visible = false
	choose_event_button_2 = $Control/randomEventPanelContainer/Choose2ButtonSprite2
	choose_event_button_2.visible = true
	choose_event_button_1 = $Control/randomEventPanelContainer/Choose1ButtonSprite
	choose_event_button_1.visible = true
	choose_event_button_1_label = $Control/randomEventPanelContainer/Choose1ButtonSprite/Choose1Button
	choose_event_button_2_label = $Control/randomEventPanelContainer/Choose2ButtonSprite2/Choose2Button
	
	activities_menu_panelContainer = $ActicitiesMenu
	activities_menu_panelContainer.visible = false
	
	activities_menu_Activity1 = $"ActicitiesMenu/Box-inside-sprite/ToddlesActivitiesOptions/ScrollArtistic"
	activities_menu_Activity1.visible = false
	activities_menu_Activity2 = $"ActicitiesMenu/Box-inside-sprite/ToddlesActivitiesOptions/ScrollMental"
	activities_menu_Activity2.visible = false
	activities_menu_Activity3 = $"ActicitiesMenu/Box-inside-sprite/ToddlesActivitiesOptions/ScrollMotor"
	activities_menu_Activity3.visible = false
	activities_menu_Activity4 = $"ActicitiesMenu/Box-inside-sprite/ToddlesActivitiesOptions/ScrollMusic"
	activities_menu_Activity4.visible = false
	activities_menu_Activity5 = $"ActicitiesMenu/Box-inside-sprite/ToddlesActivitiesOptions/ScrollChildCare"
	activities_menu_Activity5.visible = false
	
	
	update_status()
	update_label()
	game_over()
	
func profileCombine():
	if AgeNumber <= 5:
		bodySprite.texture = profile_models.body_spritesheet[0]
		clothesSprite.texture = profile_models.clothes_spritesheet[0]
	else:
		bodySprite.texture = profile_models.body_spritesheet[1]
		clothesSprite.texture = profile_models.clothes_spritesheet[1]
		if health <= 10:
			emotionSprite.texture = profile_models.emotion_spritesheet[9]
		else:
			if happiness <= 10:
				emotionSprite.texture = profile_models.emotion_spritesheet[5]
			elif happiness > 10 and happiness <= 20:
				emotionSprite.texture = profile_models.emotion_spritesheet[4]
			elif happiness > 20 and happiness <= 30:
				emotionSprite.texture = profile_models.emotion_spritesheet[3]
			elif happiness > 30 and happiness < 50 and stress < 70:
				emotionSprite.texture = profile_models.emotion_spritesheet[2]
			elif happiness >= 50 and stress < 70:
				emotionSprite.texture = profile_models.emotion_spritesheet[1]
			elif happiness >= 50 and stress < 80 and stress >= 70:
				emotionSprite.texture = profile_models.emotion_spritesheet[6]
			elif happiness >= 50 and stress < 90 and stress >= 80:
				emotionSprite.texture = profile_models.emotion_spritesheet[7]
			elif happiness >= 50 and stress >= 90:
				emotionSprite.texture = profile_models.emotion_spritesheet[8]
				#hairSprite.texture = profile_models.hair_spritesheet[0]
	bodySprite.self_modulate = profile_models.skin_color_spritesheet[skinColor]
	clothesSprite.self_modulate = clothesColor
		
func hidePanel():
	random_event_panelContainer.visible = false

func update_status():
	health = clamp(health, 0, 100)
	happiness = clamp(happiness, 0, 100)
	charisma = clamp(charisma, 0, 100)
	intelligence = clamp(intelligence, 0, 100)
	appearance = clamp(appearance, 0, 100)
	stress = clamp(stress, 0, 100)
	$StatusProfile/StatusProfileVbox/StatusContainerMargin/StatusContainer/StatusContainerBars/HealthContainerBar/HealthBar.value = health
	$StatusProfile/StatusProfileVbox/StatusContainerMargin/StatusContainer/StatusContainerBars/HappinesContainerBar/HappinessBar.value = happiness
	$StatusProfile/StatusProfileVbox/StatusContainerMargin/StatusContainer/StatusContainerBars/CharismaContainerBar/CharismaBar.value = charisma
	$StatusProfile/StatusProfileVbox/StatusContainerMargin/StatusContainer/StatusContainerBars/IntelligenceContainerBar/IntelligenceBar.value = intelligence
	$StatusProfile/StatusProfileVbox/StatusContainerMargin/StatusContainer/StatusContainerBars/AppearanceContainer/AppearanceBar.value = appearance
	$StatusProfile/StatusProfileVbox/StatusContainerMargin/StatusContainer/StatusContainerBars/StressContainer/StressBar.value = stress
	profileCombine()

func update_label():
	AgeLabel.text = "Age " + str(AgeNumber)

func update_energy():
	$EnergyBar.value = energy

func _on_next_year_button_pressed():
	AgeNumber += 1
	update_label()
		
	energy = 100
	update_energy()
	
	stress += 10
	
	appearance_age()
	happiness_on_health()
	stress_on_happiness()
	update_status()
	
	profileCombine()
	
	death_event()
	game_over()
	
	if AgeNumber < 5:
		random_event()

func _on_activity_button_pressed():
	energy -= 10
	update_energy()

func _on_close_random_event_button_pressed():
	hidePanel()
	choose_event()

func _on_choose_2_button_pressed():
	print(health)
	print(appearance)
	choose_event_option_2_toodler()
	update_status()
	print(health)
	print(appearance)
	random_event_panelContainer.visible = false
	

func _on_choose_1_button_pressed():
	print(health)
	print(appearance)
	choose_event_option_1_toodler()
	update_status()
	print(health)
	print(appearance)
	random_event_panelContainer.visible = false

func appearance_age():
	if AgeNumber < 13:
		appearance += 1
	elif AgeNumber < 21:
		appearance += randi_range(-1, 1)
	elif AgeNumber < 26:
		appearance += 1
	elif AgeNumber > 40:
		appearance -= 1

func happiness_on_health():
	if happiness < 10:
		health -= 10
	elif happiness < 30:
		health -= 5
	elif happiness < 50:
		health -= 1

func stress_on_happiness():
	if stress > 50:
		happiness -= 10
	elif stress > 70:
		happiness -= 15
	elif stress > 90:
		happiness -= 20

func death_event():
	var deathVisit = randf()  # Generate a random number between 0 and 1
	healthrisk = 50.0 / health
	if AgeNumber <= 19:
		if deathVisit <= 0.0012*2*healthrisk:
			health = 0
	elif AgeNumber > 19 and AgeNumber <= 39:
		if deathVisit <= 0.0030*2*healthrisk:
			health = 0
	elif AgeNumber > 39 and AgeNumber <= 59:
		if deathVisit <= 0.015*2*healthrisk:
			health = 0
	elif AgeNumber > 59 and AgeNumber <= 79:
		if deathVisit <= 0.055*2*healthrisk:
			health = 0
	elif AgeNumber > 79 and AgeNumber <= 85:
		if deathVisit <= 0.195*2*healthrisk:
			health = 0
	elif AgeNumber > 85 and AgeNumber <= 95:
		if deathVisit <= 0.50*2*healthrisk:
			health = 0
	elif AgeNumber > 95:
		if deathVisit <= 0.85*2*healthrisk:
			health = 0

func game_over():
	if health == 0:
		
		# Update the game state
		Global.AgeNumber = AgeNumber
		Global.health = 50
		Global.happiness = 100
		Global.charisma = charisma
		Global.intelligence = intelligence
		Global.appearance = appearance
		Global.stress = stress
		
		get_tree().change_scene_to_file("res://you_died.tscn")
		# Replace "path_to_second_scene.tscn" with the actual path to your second scene
		# You can use an absolute path or relative path from the project root
		# Optionally, you can call `free()` to free up the resources of the current scene
		# before transitioning to the second scene

func luck_coin():
	coin_throw = randf()  # Generate a random number between 0 and 1
	
func random_event(): 
	luck_coin()
	print(coin_throw)
	#var event_type = randi() % 2
	var random_event_number = randi() % 8
	random_event_panelContainer.visible = true
	choose_event_button_2.visible = false
	choose_event_button_1.visible = false
	if AgeNumber < 5:
		if coin_throw <= 0.5:
			$Control/randomEventPanelContainer/MarginContainer/HBoxContainer/LuckEventLabel.bbcode_text = "[b]" + random_event_good_luck_title_toodler[random_event_number] + "[/b]" + random_event_good_luck_toodler[random_event_number] + "[color=blue]" + random_event_good_luck_bonnus_toodler[random_event_number] + "[/color]"
			random_event_dialog_good_bonnus(random_event_number)
		elif coin_throw > 0.5:
			$Control/randomEventPanelContainer/MarginContainer/HBoxContainer/LuckEventLabel.bbcode_text = "[b]" + random_event_bad_luck_title_toodler[random_event_number] + "[/b]" + random_event_bad_luck_toodler[random_event_number] + "[color=red]" + random_event_bad_luck_bonnus_toodler[random_event_number] + "[/color]"
			random_event_dialog_bad_bonnus(random_event_number)
	elif AgeNumber < 13:
		if coin_throw <= 0.33:
			pass #random_event_label = "good luck"
		elif coin_throw > 0.33 and coin_throw <= 0.66:
			pass #random_event_label = "bad luck"
	elif AgeNumber < 18:
		if coin_throw <= 0.33:
			pass #random_event_label = "good luck"
		elif coin_throw > 0.33 and coin_throw <= 0.66:
			pass #random_event_label = "bad luck"
	elif AgeNumber >= 18:
		if coin_throw <= 0.33:
			pass #random_event_label = "good luck"
		elif coin_throw > 0.33 and coin_throw <= 0.66:
			pass #random_event_label = "bad luck"
	
func choose_event():	
	luck_coin()
	print(coin_throw)
	if  coin_throw <= 0.5:
		var random_event_number = randi() % 2
		Global.RandomEventNumber = random_event_number
		random_event_panelContainer.visible = true
		choose_event_button_2.visible = true
		choose_event_button_1.visible = true
		if AgeNumber < 5:
			$Control/randomEventPanelContainer/MarginContainer/HBoxContainer/LuckEventLabel.bbcode_text = "[b]" + choose_event_title_toodler[random_event_number] + "[/b]" + choose_event_toodler[random_event_number] + "[color=blue]"
			choose_event_button_1_label.text = choose_event_option_1_label_toodler[random_event_number]
			choose_event_button_2_label.text = choose_event_option_2_label_toodler[random_event_number]

func random_event_dialog_good_bonnus(random_event_number):
	if random_event_number <= 1:
		happiness += 5
	if random_event_number >1 and random_event_number <= 3:
		intelligence += 5
	if random_event_number >3 and random_event_number <= 5:
		health += 5
	if random_event_number >5 and random_event_number <= 7:
		charisma += 5
	update_status()

func random_event_dialog_bad_bonnus(random_event_number):
	if random_event_number < 1:
		happiness -= 5
	if random_event_number >1 and random_event_number <= 3:
		intelligence -= 5
	if random_event_number >3 and random_event_number <= 5:
		health -= 5
	if random_event_number >5 and random_event_number <= 7:
		charisma -= 5
	update_status()

func _on_acticities_menu_hide():
	activities_menu_Activity1.visible = false
	activities_menu_Activity2.visible = false
	activities_menu_Activity3.visible = false
	activities_menu_Activity4.visible = false
	activities_menu_Activity5.visible = false

func _on_acticities_menu_show(menu_panelContainer):
	menu_panelContainer.show()

func _on_activities_button_pressed():
	_on_acticities_menu_show(activities_menu_panelContainer)

func _on_acticities_menu_box_close_button_pressed():
	activities_menu_panelContainer.hide()

func _on_activity_1_pressed():
	_on_acticities_menu_hide()
	_on_acticities_menu_show(activities_menu_Activity1)

func _on_activity_2_pressed():
	_on_acticities_menu_hide()
	_on_acticities_menu_show(activities_menu_Activity2)

func _on_activity_3_pressed():
	_on_acticities_menu_hide()
	_on_acticities_menu_show(activities_menu_Activity3)

func _on_activity_4_pressed():
	_on_acticities_menu_hide()
	_on_acticities_menu_show(activities_menu_Activity4)

func _on_activity_5_pressed():
	_on_acticities_menu_hide()
	_on_acticities_menu_show(activities_menu_Activity5)

#Activity 1 buttons
func _on_texture_button_4_pressed():
	if energy >= 10:
		energy -= 10
		stress -= randf() * 11.0
		happiness += randf() * 11.0
	else:
		print("not enough energy")
	update_energy()
	update_status()

func _on_texture_button_2_pressed():
	if energy >= 10:
		energy -= 10
		stress -= randf() * 11.0
		happiness += randf() * 11.0
	else:
		print("not enough energy")
	update_energy()
	update_status()

## profile
@onready var bodySprite = $StatusProfile/StatusProfileVbox/ProfielContainerMarginr/PanelContainer/body
@onready var clothesSprite = $StatusProfile/StatusProfileVbox/ProfielContainerMarginr/PanelContainer/clothes
@onready var emotionSprite = $StatusProfile/StatusProfileVbox/ProfielContainerMarginr/PanelContainer/emotion

const profile_models = preload("res://Assets/character-models/profile-models.gd")





