extends Node

const skin_color_spritesheet={
	0 : Color(255/255.0,220/255.0,177/255.0),
	1 : Color(229/255.0,194/255.0,152/255.0),
	2 : Color(228/255.0,185/255.0,142/255.0),
	3 : Color(226/255.0,185/255.0,143/255.0),
	4 : Color(227/255.0,161/255.0,115/255.0),
	5 : Color(217/255.0,145/255.0,100/255.0),
	6 : Color(204/255.0,132/255.0,67/255.0),
	7 : Color(199/255.0,165/255.0,134/255.0),
	8 : Color(165/255.0,57/255.0,0/255.0),
	9 : Color(134/255.0,4/255.0,0/255.0),
	10 : Color(113/255.0,2/255.0,0/255.0),
	11 : Color(68/255.0,0/255.0,0/255.0),
	12 : Color(255/255.0,224/255.0,196/255.0),
	13 : Color(238/255.0,207/255.0,180/255.0),
	14 : Color(222/255.0,171/255.0,127/255.0),
	15 : Color(224/255.0,177/255.0,132/255.0),
	16 : Color(223/255.0,166/255.0,117/255.0),
	17 : Color(190/255.0,114/255.0,60/255.0),
	18 : Color(100/255.0,25/255.0,0/255.0),
	19 : Color(91/255.0,0/255.0,0/255.0),
	20 : Color(253/255.0,228/255.0,200/255.0),
	21 : Color(239/255.0,228/255.0,200/255.0),
	22 : Color(239/255.0,214/255.0,234/255.0),
	23 : Color(234/255.0,189/255.0,157/255.0),
	24 : Color(227/255.0,194/255.0,124/255.0),
	25 : Color(223/255.0,185/255.0,151/255.0),
	26 : Color(208/255.0,146/255.0,110/255.0),
	27 : Color(189/255.0,151/255.0,120/255.0),
	28 : Color(187/255.0,109/255.0,74/255.0),
	29 : Color(148/255.0,10/255.0,0/255.0),
	30 : Color(225/255.0,173/255.0,164/255.0),
	31 : Color(165/255.0,136/255.0,105/255.0),
	32 : Color(123/255.0,0/255.0,0/255.0),
	33 : Color(114/255.0,0/255.0,0/255.0),
	34 : Color(56/255.0,0/255.0,0/255.0)
}

const body_spritesheet ={
	0 : preload("res://Assets/character-models/baby-body.png"),
	1 : preload("res://Assets/character-models/adult-body.png")	
}

const clothes_spritesheet ={
	0 : preload("res://Assets/character-models/baby-shoes.png"),
	1 : preload("res://Assets/character-models/adult-clothe1.png")
}

const emotion_spritesheet ={
	0 : preload("res://Assets/character-models/adult-emotion-happy-100.png"),
	1 : preload("res://Assets/character-models/adult-emotion-happy-50.png"),
	2 : preload("res://Assets/character-models/adult-emotion-happy-40.png"),
	3 : preload("res://Assets/character-models/adult-emotion-happy-30.png"),
	4 : preload("res://Assets/character-models/adult-emotion-happy-20.png"),
	5 : preload("res://Assets/character-models/adult-emotion-happy-10.png"),
	6 : preload("res://Assets/character-models/adult-emotion-stress-50.png"),
	7 : preload("res://Assets/character-models/adult-emotion-stress-30.png"),
	8 : preload("res://Assets/character-models/adult-emotion-stress-10.png"),
	9 : preload("res://Assets/character-models/sick.png")
}
