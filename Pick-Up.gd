extends Area2D

var overlappingPickUp
var player
# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if(overlappingPickUp && Input.is_action_just_pressed("ui_select")):
		player.pickUp(get_node("."))
	pass


func _on_PickUp_body_entered(body):
	print_debug("Entering body")
	overlappingPickUp = true
	player = body
	pass # Replace with function body.


func _on_PickUp_body_exited(body):
	overlappingPickUp = false
	print_debug("Leaving Body")
	pass # Replace with function body.
