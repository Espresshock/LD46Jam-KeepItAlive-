extends Node2D

var textLabelReference

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	textLabelReference = get_node("../PlayerCharacter/Camera2D/ParallaxBackground/Control/NarrativeTextLabel")
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	checkPeopleDead()
	pass

	
func checkPeopleDead():
	if(textLabelReference.x == 37):
		deletePerson("Sarah")
	elif(textLabelReference.x == 64):
		deletePerson("Ben")
	elif(textLabelReference.x == 80):
		deletePerson("Mike")
	pass

func deletePerson(person):
	var personRef = get_node(person)
	personRef.visible = false
	pass
