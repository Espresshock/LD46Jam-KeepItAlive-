extends Area2D

var playerReference

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	playerReference = get_node("../../PlayerCharacter")
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(_delta):
#	pass


func _on_PickUp_body_entered(body):
	if(body == playerReference):
		body.overlappingPickUp = true
		body.pickUpReference = self
	pass # Replace with function body.


func _on_PickUp_body_exited(body):
	if(body == playerReference):
		body.overlappingPickUp = false
	pass # Replace with function body.
