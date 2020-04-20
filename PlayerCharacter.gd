extends KinematicBody2D

var motion = Vector2()
var motionX = 0
var motionY = 0
var movementSpeed = 100

var overlappingPickUp
var holdingPickUp
var pickUpReference

var playerNearCampfire
var campfire

var chooseNarrativeOption

var PlayerCharacter = KinematicBody2D
var textLabel = RichTextLabel

# Called when the node enters the scene tree for the first time.
func _ready():
	PlayerCharacter = get_node("/root")
	textLabel = get_node("Camera2D/ParallaxBackground/Control/NarrativeTextLabel")
	campfire = get_node("../FirePlace")
	holdingPickUp = false
	pass # Replace with function body.


func _process(_delta):
	executeMotion()
	executePickUp()
	selectNarative()
	if(textLabel.playerTurnTracker >= 4):
		campfire.campfireTimer()
	elif(!textLabel.playerTurnTracker >= 4):
		campfire.campFireAutoBurn()
	pass


func executeMotion():
	if(textLabel.playerTurnTracker >= 4):
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

func executePickUp():
	if(Input.is_action_just_pressed("ui_select") && overlappingPickUp):
		pickUp(pickUpReference)
	elif(holdingPickUp):
		updatePickUp(pickUpReference)
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
	elif(holdingPickUp && playerNearCampfire):
		pickUpTarget.get_parent().remove_child(pickUpTarget)
		holdingPickUp = false
		campfire.addLog()
	pass
	
func updatePickUp(target):
	if(holdingPickUp):
		target.set_transform(Transform2D(self.get_transform()))
	pass
