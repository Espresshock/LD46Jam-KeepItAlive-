extends KinematicBody2D

var motion = Vector2()
var motionX = 0
var motionY = 0
var movementSpeed = 100


var pickUpNode
var holdingPickUp
var playerNearCampfire
var campfire

var chooseNarrativeOption

var PlayerCharacter = KinematicBody2D
var textLabel = RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerCharacter = get_node("/root")
	textLabel = get_node("Camera2D/NarrativeTextLabel")
	campfire = get_node("../FirePlace")
	
	pass # Replace with function body.


func _process(_delta):
	executeMotion()
	updatePickUp(pickUpNode)
	selectNarative()
	
	pass


func executeMotion():
	
	if(Input.is_action_pressed("ui_right")):
		motionX = movementSpeed
		$CharacterAnimations.rotation_degrees = 0
	elif(Input.is_action_pressed("ui_left")):
		motionX = -movementSpeed
		$CharacterAnimations.rotation_degrees = 180
	else:
		motionX = 0
	
	if(Input.is_action_pressed("ui_up")):
		motionY = -movementSpeed
		$CharacterAnimations.rotation_degrees = -90
	elif(Input.is_action_pressed("ui_down")):
		motionY = movementSpeed	
		$CharacterAnimations.rotation_degrees = 90
	else:
		motionY = 0
		
	motion = Vector2(motionX, motionY)
	
	if(motion == Vector2(0,0)):
		$CharacterAnimations.play("idle")
	elif(motion == Vector2(movementSpeed,-movementSpeed)):
		$CharacterAnimations.rotation_degrees = -45
	elif(motion == Vector2(movementSpeed,movementSpeed)):
		$CharacterAnimations.rotation_degrees = 45
	elif(motion == Vector2(-movementSpeed,movementSpeed)):
		$CharacterAnimations.rotation_degrees = 135
	elif(motion == Vector2(-movementSpeed,-movementSpeed)):
		$CharacterAnimations.rotation_degrees = -135
	else:
		$CharacterAnimations.play("walking")
	return move_and_slide(motion)
	
	pass

func selectNarative():
	if(chooseNarrativeOption):
		if(Input.is_action_just_pressed("PressKey1")):
			textLabel.playersChoice(0)
			chooseNarrativeOption = false
		elif(Input.is_action_just_pressed("PressKey2")):
			textLabel.playersChoice(1)
			chooseNarrativeOption = false
		elif(Input.is_action_just_pressed("PressKey3")):
			textLabel.playersChoice(2)	
			chooseNarrativeOption = false
	pass

func pickUp(pickUpTarget):
	if(!holdingPickUp):
		pickUpTarget.get_parent().remove_child(pickUpTarget)
		PlayerCharacter.add_child(pickUpTarget)
		holdingPickUp = true
		pickUpNode = pickUpTarget
	elif(holdingPickUp && playerNearCampfire):
		pickUpTarget.get_parent().remove_child(pickUpTarget)
		holdingPickUp = false
		campfire.addLog()
	pass
	
func updatePickUp(target):
	if(holdingPickUp):
		target.set_transform(Transform2D(get_transform()))
	pass
