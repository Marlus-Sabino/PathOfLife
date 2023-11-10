extends Node

#Set on ready variables
##Basic information and its labels
@onready var sexIdentity
@onready var profileName
@onready var profileSurname
@onready var skinColor = randi() %35
@onready var clothesColor = Color(randf(), randf(), randf())
@onready var NameLabel = $BasicInfoContainer/BasicInfoVBox/NameLabel
@onready var SexIdentityLabel = $BasicInfoContainer/BasicInfoVBox/SexIndentityLabel
@onready var AgeLabel = $BasicInfoContainer/BasicInfoVBox/Age_Label
@onready var OcuppationLabel = $BasicInfoContainer/BasicInfoVBox/OcupationLabel
##Set initial energy and status
@onready var AgeNumber = 0
@onready var energy = 100
@onready var healthrisk = 0.5
@onready var health = 100
@onready var happiness = 100
@onready var charisma = 100
@onready var intelligence = 100
@onready var appearance = 100
@onready var stress = 100
@onready var coin_throw
##Set scene nodes type
@onready var random_event_panelContainer:Control
@onready var activities_menu_panelContainer:Control
@onready var activities_menu_Activity1:ScrollContainer
@onready var activities_menu_Activity2:ScrollContainer
@onready var activities_menu_Activity3:ScrollContainer
@onready var activities_menu_Activity4:ScrollContainer
@onready var activities_menu_Activity5:ScrollContainer
@onready var choose_event_button_4:Sprite2D
@onready var choose_event_button_3:Sprite2D
@onready var choose_event_button_2:Sprite2D
@onready var choose_event_button_1:Sprite2D
@onready var random_event_texture:Sprite2D
@onready var choose_event_button_1_label:Button
@onready var choose_event_button_2_label:Button
@onready var choose_event_button_3_label:Button
@onready var choose_event_button_4_label:Button
## profile
@onready var bodySprite = $StatusProfile/StatusProfileVbox/ProfielContainerMarginr/PanelContainer/body
@onready var clothesSprite = $StatusProfile/StatusProfileVbox/ProfielContainerMarginr/PanelContainer/clothes
@onready var emotionSprite = $StatusProfile/StatusProfileVbox/ProfielContainerMarginr/PanelContainer/emotion
const profile_models = preload("res://Assets/character-models/profile-models.gd")

func _ready():
	#Initialize status
	AgeNumber = Global.AgeNumber
	health = Global.health
	happiness = Global.happiness
	charisma = Global.charisma
	intelligence = Global.intelligence
	appearance = Global.appearance
	stress = Global.stress
	SexIndentityCoin()
	sexIdentity = Global.SexIdentity 
	give_name()
	profileName = Global.ProfileName
	profileSurname = Global.ProfileSurname
	var fullName = (profileName + " " + profileSurname).strip_edges()
	NameLabel.text = fullName
	SexIdentityLabel.text = sexIdentity
	OcuppationLabel.text = "baby"
	#Set scene nodes
	##random event
	random_event_panelContainer = $Control
	random_event_panelContainer.visible = false
	random_event_texture = $Control/randomEventPanelContainer/MarginContainer/HBoxContainer/PanelContainer/VSplitContainer/randomEventSprite
	##choose event
	choose_event_button_4 = $Control/randomEventPanelContainer/Choose4ButtonSprite
	choose_event_button_4.visible = true
	choose_event_button_3 = $Control/randomEventPanelContainer/Choose3ButtonSprite
	choose_event_button_3.visible = true
	choose_event_button_2 = $Control/randomEventPanelContainer/Choose2ButtonSprite
	choose_event_button_2.visible = true
	choose_event_button_1 = $Control/randomEventPanelContainer/Choose1ButtonSprite
	choose_event_button_1.visible = true
	choose_event_button_1_label = $Control/randomEventPanelContainer/Choose1ButtonSprite/Choose1Button
	choose_event_button_2_label = $Control/randomEventPanelContainer/Choose2ButtonSprite/Choose2Button
	choose_event_button_3_label = $Control/randomEventPanelContainer/Choose3ButtonSprite/Choose3Button
	choose_event_button_4_label = $Control/randomEventPanelContainer/Choose4ButtonSprite/Choose4Button
	##activites menu
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
	#update status
	update_status()
	game_over()

func luck_coin():
	coin_throw = randf()  # Generate a random number between 0 and 1
#Set sex identity
func SexIndentityCoin():
	luck_coin()
	if coin_throw<=0.5:
		sexIdentity = "male"
	else:
		sexIdentity = "female"
	Global.SexIdentity = sexIdentity
#Set name
func give_name():
	#Set initial variables
	var file
	var contents
	var randomIndex
	var names_option
	var surnames_option
	var path_surname = "res://surnames.txt"
	var path_name
	var sexIdentity = Global.SexIdentity 
	#Select names list based on sexIdentity
	if sexIdentity == "male":
		path_name = "res://names_male.txt"
	elif sexIdentity == "female":
		path_name = "res://names_female.txt"
	#Extract names list
	file = FileAccess.open(path_name,FileAccess.READ)
	contents = file.get_as_text()
	file.close()
	names_option = contents.split("\n")
	file = FileAccess.open(path_surname,FileAccess.READ)
	contents = file.get_as_text()
	file.close()
	surnames_option = contents.split("\n")
	#Choose name
	randomIndex = randi() % names_option.size()
	profileName = names_option[randomIndex]
	randomIndex = randi() % surnames_option.size()
	profileSurname = surnames_option[randomIndex]
	#Set name
	Global.ProfileName = profileName.strip_edges()
	Global.ProfileSurname = profileSurname.strip_edges()
#Set profile caracter 
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

func update_status():
	health = clamp(health, 0, 100)
	happiness = clamp(happiness, 0, 100)
	charisma = clamp(charisma, 0, 100)
	intelligence = clamp(intelligence, 0, 100)
	appearance = clamp(appearance, 0, 100)
	stress = clamp(stress, 0, 100)
	$EnergyBar.value = energy
	AgeLabel.text = "Age " + str(AgeNumber)
	$StatusProfile/StatusProfileVbox/StatusContainerMargin/StatusContainer/StatusContainerBars/HealthContainerBar/HealthBar.value = health
	$StatusProfile/StatusProfileVbox/StatusContainerMargin/StatusContainer/StatusContainerBars/HappinesContainerBar/HappinessBar.value = happiness
	$StatusProfile/StatusProfileVbox/StatusContainerMargin/StatusContainer/StatusContainerBars/CharismaContainerBar/CharismaBar.value = charisma
	$StatusProfile/StatusProfileVbox/StatusContainerMargin/StatusContainer/StatusContainerBars/IntelligenceContainerBar/IntelligenceBar.value = intelligence
	$StatusProfile/StatusProfileVbox/StatusContainerMargin/StatusContainer/StatusContainerBars/AppearanceContainer/AppearanceBar.value = appearance
	$StatusProfile/StatusProfileVbox/StatusContainerMargin/StatusContainer/StatusContainerBars/StressContainer/StressBar.value = stress
	profileCombine()

func _on_next_year_button_pressed():
	AgeNumber += 1
	energy = 100
	appearance_age()
	happiness_on_health()
	stress_on_happiness()
	update_status()
	profileCombine()
	death_event()
	game_over()
	if AgeNumber<=3:
		random_event()

func _on_activity_button_pressed():
	energy -= 10
	update_status()

func _on_close_random_event_button_pressed():
	random_event_panelContainer.visible = false
	choose_event()

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
		if deathVisit <= 0.00012*2*healthrisk:
			health = 0
	elif AgeNumber > 19 and AgeNumber <= 39:
		if deathVisit <= 0.00030*2*healthrisk:
			health = 0
	elif AgeNumber > 39 and AgeNumber <= 59:
		if deathVisit <= 0.0015*2*healthrisk:
			health = 0
	elif AgeNumber > 59 and AgeNumber <= 79:
		if deathVisit <= 0.0055*2*healthrisk:
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
	update_status()

func _on_texture_button_2_pressed():
	if energy >= 10:
		energy -= 10
		stress -= randf() * 11.0
		happiness += randf() * 11.0
	else:
		print("not enough energy")
	update_status()

#random event
func random_event():
	# Initialize pannels
	luck_coin()
	random_event_panelContainer.visible = true
	choose_event_button_2.visible = false
	choose_event_button_1.visible = false
	choose_event_button_3.visible = false
	choose_event_button_4.visible = false
	#select event file
	var file
	if coin_throw <= 0.5:
		if AgeNumber < 5:
			file = FileAccess.open("res://data/toddler_randon_event_good.txt",FileAccess.READ)
		elif AgeNumber < 13:
			pass
		elif AgeNumber < 18:
			pass
		elif AgeNumber >= 18:
			pass
	elif coin_throw > 0.5:
		if AgeNumber < 5:
			file = FileAccess.open("res://data/toddler_randon_event_bad.txt",FileAccess.READ)
		elif AgeNumber < 13:
			pass
		elif AgeNumber < 18:
			pass
		elif AgeNumber >= 18:
			pass
	# Generate events possibilities
	var event_list = file.get_as_text()
	var event_contents = file.get_as_text()
	var separeted_events = event_contents.split("\n")
	var line_count = 0
	while !file.eof_reached():
		var line = file.get_line()
		if line != "":
			line_count += 1
	file.close() 
	# Choose event
	var random_event_number = randi() % (line_count - 1) + 1
	print(random_event_number)
	var choose_event_line = separeted_events[random_event_number]
	var choose_event = choose_event_line.split("\t")
	var choose_event_title = choose_event[0]
	var choose_event_text = choose_event[1]
	var choose_event_bonus = choose_event[2]
	var choose_event_bonus_type = choose_event[3]
	# Print results
	if coin_throw <= 0.5:
		var event_message_display = "[b]" + choose_event_title + "[/b]" + "\n\n" + choose_event_text + "[color=blue]" + "\n\n" + choose_event_bonus + "[/color]"
		$Control/randomEventPanelContainer/MarginContainer/HBoxContainer/LuckEventLabel.bbcode_text = event_message_display
		random_event_texture.texture = preload("res://Assets/smile.png")
	elif coin_throw > 0.5:
		var event_message_display = "[b]" + choose_event_title + "[/b]" + "\n\n" + choose_event_text + "[color=red]" + "\n\n" + choose_event_bonus + "[/color]"
		$Control/randomEventPanelContainer/MarginContainer/HBoxContainer/LuckEventLabel.bbcode_text = event_message_display
		random_event_texture.texture = preload("res://Assets/sad.png")
	# Apply bonus effect
	if choose_event_bonus_type == "Happiness":
		happiness  += 5	
	elif choose_event_bonus_type == "Intelligence":
		intelligence += 5	
	elif choose_event_bonus_type == "Health":
		health  += 5	
	elif choose_event_bonus_type == "Charisma":
		charisma  += 5
	update_status()

# choose event section
func choose_event():
	luck_coin()
	print(coin_throw)
	if  coin_throw <= 0.5:
		var file
		if AgeNumber < 5:
			file = FileAccess.open("res://data/toddler_choose_event.txt",FileAccess.READ)
		elif AgeNumber < 13:
			pass
		elif AgeNumber < 18:
			pass
		elif AgeNumber >= 18:
			pass
		# Generate events possibilities
		var event_list = file.get_as_text()
		var event_contents = file.get_as_text()
		var separeted_events = event_contents.split("\n")
		var line_count = 0
		while !file.eof_reached():
			var line = file.get_line()
			if line != "":
				line_count += 1
		file.close() 
		# Choose event
		var random_event_number = randi() % (line_count - 1) + 1
		print(random_event_number)
		var choose_event_line = separeted_events[random_event_number]
		var choose_event = choose_event_line.split("\t")
		var choose_event_title = choose_event[0]
		var choose_event_text = choose_event[1]
		var choose_event_option_1 = choose_event[2]
		var choose_event_option_2 = choose_event[3]
		var choose_event_option_3 = choose_event[4]
		var choose_event_option_4 = choose_event[5]
		var choose_event_bonus_type_1 = choose_event[6]
		var choose_event_bonus_type_2 = choose_event[7]
		var choose_event_bonus_type_3 = choose_event[8]
		var choose_event_bonus_type_4 = choose_event[9]
		var choose_event_bonus_impact_1 = choose_event[10]
		var choose_event_bonus_impact_2 = choose_event[11]
		var choose_event_bonus_impact_3 = choose_event[12]
		var choose_event_bonus_impact_4 = choose_event[13]
		var choose_event_bonus = choose_event[14]
		
		Global.choose_event_bonus_type_1 = choose_event[6]
		Global.choose_event_bonus_type_2 = choose_event[7]
		Global.choose_event_bonus_type_3 = choose_event[8]
		Global.choose_event_bonus_type_4 = choose_event[9]
		Global.choose_event_bonus_impact_1 = choose_event[10]
		Global.choose_event_bonus_impact_2 = choose_event[11]
		Global.choose_event_bonus_impact_3 = choose_event[12]
		Global.choose_event_bonus_impact_4 = choose_event[13]
		Global.choose_event_bonus = choose_event[14]
		
		random_event_panelContainer.visible = true
		if choose_event_option_1 != "":
			choose_event_button_1.visible = true
			choose_event_button_1_label.text = choose_event_option_1
		if choose_event_option_2 != "":
			choose_event_button_2.visible = true
			choose_event_button_2_label.text = choose_event_option_2
		if choose_event_option_3 != "":
			choose_event_button_3.visible = true
			choose_event_button_3_label.text = choose_event_option_3
		if choose_event_option_4 != "":
			choose_event_button_4.visible = true
			choose_event_button_4_label.text = choose_event_option_4
			
		var event_message_display = "[b]" + choose_event_title + "[/b]" + "\n\n" + choose_event_text
		$Control/randomEventPanelContainer/MarginContainer/HBoxContainer/LuckEventLabel.bbcode_text = event_message_display
		random_event_texture.texture = preload("res://Assets/attention.png")

func _on_choose_1_button_pressed():
	var selected_choose_event_bonus_type = Global.choose_event_bonus_type_1
	Global.selected_choose_event_bonus_type = selected_choose_event_bonus_type
	var selected_choose_event_bonus_impact = Global.choose_event_bonus_impact_1
	Global.selected_choose_event_bonus_impact = selected_choose_event_bonus_impact
	choose_event_bonus()
	update_status()
	random_event_panelContainer.visible = false

func _on_choose_2_button_pressed():
	var selected_choose_event_bonus_type = Global.choose_event_bonus_type_2
	Global.selected_choose_event_bonus_type = selected_choose_event_bonus_type
	var selected_choose_event_bonus_impact = Global.choose_event_bonus_impact_2
	Global.selected_choose_event_bonus_impact = selected_choose_event_bonus_impact
	choose_event_bonus()
	update_status()
	random_event_panelContainer.visible = false

func _on_choose_3_button_pressed():
	var selected_choose_event_bonus_type = Global.choose_event_bonus_type_3
	Global.selected_choose_event_bonus_type = selected_choose_event_bonus_type
	var selected_choose_event_bonus_impact = Global.choose_event_bonus_impact_3
	Global.selected_choose_event_bonus_impact = selected_choose_event_bonus_impact
	choose_event_bonus()
	update_status()
	random_event_panelContainer.visible = false

func _on_choose_4_button_pressed():
	var selected_choose_event_bonus_type = Global.choose_event_bonus_type_4
	Global.selected_choose_event_bonus_type = selected_choose_event_bonus_type
	var selected_choose_event_bonus_impact = Global.choose_event_bonus_impact_4
	Global.selected_choose_event_bonus_impact = selected_choose_event_bonus_impact
	choose_event_bonus()
	update_status()
	random_event_panelContainer.visible = false

func choose_event_bonus():
	var choose_event_bonus = Global.choose_event_bonus
	var selected_choose_event_bonus_type = Global.selected_choose_event_bonus_type
	var selected_choose_event_bonus_impact = Global.selected_choose_event_bonus_impact
	choose_event_bonus = choose_event_bonus.to_int()
	if selected_choose_event_bonus_impact == "positive":
		if selected_choose_event_bonus_type == "Health":
			health += choose_event_bonus
		elif selected_choose_event_bonus_type == "Happiness":
			happiness += choose_event_bonus
		elif selected_choose_event_bonus_type == "Charisma":
			charisma += choose_event_bonus
		elif selected_choose_event_bonus_type == "Intelligence":
			intelligence += choose_event_bonus
		elif selected_choose_event_bonus_type == "Appearance":
			appearance += choose_event_bonus
		elif selected_choose_event_bonus_type == "Stress":
			stress += choose_event_bonus
	elif selected_choose_event_bonus_impact == "negative":
		if selected_choose_event_bonus_type == "Health":
			health -= choose_event_bonus
		elif selected_choose_event_bonus_type == "Happiness":
			happiness -= choose_event_bonus
		elif selected_choose_event_bonus_type == "Charisma":
			charisma -= choose_event_bonus
		elif selected_choose_event_bonus_type == "Intelligence":
			intelligence -= choose_event_bonus
		elif selected_choose_event_bonus_type == "Appearance":
			appearance -= choose_event_bonus
		elif selected_choose_event_bonus_type == "Stress":
			stress -= choose_event_bonus
