extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var campfire
var timer
var fireSprite 
var newLog
var burnTime

# Called when the node enters the scene tree for the first time.
func _ready():
#	campfire = 4
	timer = Timer.new()
	timer.connect("timeout", self, "_on_timer_timeout")
	burnTime = 30.0
	fireSprite = get_node("fireAnimationNode/AnimatedFireSprite")
	newLog = true
	add_child(timer)
	pass # Replace with function body.

func _process(_delta):
	campfireTimer()
	pass

func _on_timer_timeout():
#	campfire -= 0
	get_node("fireAnimationNode/Fire").enabled = false
	get_node("fireAnimationNode/AnimatedFireSprite").visible = false
	get_node("FireParticles").emitting = false
	newLog = true
	pass
	
func addLog():
	var fireScaleAnimation = get_node("fireAnimationNode/AnimationPlayer")
	var currentSecond = fireScaleAnimation.get("current_animation_position")
	fireScaleAnimation.seek(currentSecond -10,true)
	newLog = true

func _on_FirePlace_body_entered(body):
	var fireScaleAnimation = get_node("fireAnimationNode/AnimationPlayer")
	var currentSecond = fireScaleAnimation.get("current_animation_position")
	if(body.get_name() == "PlayerCharacter"):
		print_debug("Player enters campfire")
		print_debug(currentSecond)
		body.playerNearCampfire = true
	pass # Replace with function body.


func _on_FirePlace_body_exited(body):
	if(body.get_name() == "PlayerCharacter"):
		print_debug("Player leaves campfire")
		body.playerNearCampfire = false
	pass # Replace with function body.

func campfireTimer():
	var fireScaleAnimation = get_node("fireAnimationNode/AnimationPlayer")
	var currentSecond = fireScaleAnimation.get("current_animation_position")
	if(newLog && currentSecond > 0):
		print_debug("going thru")
		timer.set_wait_time(burnTime - currentSecond)
		timer.start()
		newLog = false
	pass

func setCampfireSize():
	if(campfire == 0):
		fireSprite.set_scale(Vector2(0, 0))
	elif(campfire == 1):
		fireSprite.set_scale(Vector2(0.25, 0.25))
	elif(campfire == 2):
		fireSprite.set_scale(Vector2(0.5, 0.5))
	elif(campfire == 3):
		fireSprite.set_scale(Vector2(0.75, 0.75))
	elif(campfire == 4):
		fireSprite.set_scale(Vector2(1, 1))
	pass

