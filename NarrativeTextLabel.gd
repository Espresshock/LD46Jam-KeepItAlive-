extends RichTextLabel

var arrayPosLilly = 0
var arrayPosMike = 0
var arrayPosBen = 0
var arrayPosSarah = 0

var x = 0

var textLabel
var playerCharacterReference

var person = ["Lilly", "Mike", "Ben", "Sarah", "You"]
var storyText = []
var nextPerson = [0,0,0,0,0,0,1,0,1,2,4,3,0,1,2,2,4,3,0,1,2,4,3,0,1,2,4,3,0,0,1,2,4,3,0,3,3,1,0,2,4,0,1,0,0,2,0,0,2,4,0,0,4,0,1,2,4,0,1,2,2,4,2,2,4,0,0,1,0,0,0,1,1,4,0,1,0,0,0,1,0,0]

var speakerDictionary = {"Lilly": ["We are going to play a game, it's called “keep it alive”. It is a very simple game, and you get to use a little of your own imagination.",
 "I start out with a small part of a story, and the next person in the circle will continue the story.",
 "Now remember, it’s supposed to be a little scary, so don’t freak out. It’s your own imagination that makes it up after all. hihi.",
 "So.. I’ll start",
 "Once upon a time..",
 "There was a group of friends camping in the middle of the woods, they wanted a nice break from the busy life, but what they didn’t know…",
 "Excellent! you get it! Now, try to be as creative as possible, try to make it feel as if it was happening right now",
 "The story goes that there is a ghost in these forests, that possesses one's mind, and controls it until it is lost. And then commands it to kill.",
 "Lilly takes care of safety, she keeps an eye on the surroundings and checks up on people when they are gone for to long",
 "He could smell the new flesh that had entered its domain.",
 "*SCREECHING*",
 "*Lilly laughs* bwhahaha got you there, I am sorry, let’s continue…",
 "Take you time Sarah! Remember, don’t be gone for longer than a minute, or I will come and check on you.",
 "The Ghost waited.. and waited.. the smell of human flesh and soul smelled… extraordinarily tasty tonight. Not often such a special group comes to the forest.",
 "I will go check on Sarah.. she has been gone for 2 minutes already.",
 "*Lilly returns with a worried expression across her face*",
 "Guys Sarah is gone!...Sarah! Sarah where are you?!",
 "You.. You’re probably right.. sorry for my overreaction.. I guess I was a little scared myself because of the stories",
 "I will text her if she is ok",
 "*bzzt bzzt*... Hey! I got a text, it's from Sarah... ",
 "She says she went home real quick to get some stuff... weird... why did she not tell us that before she left...",
 "With one down and only four to go… he knew the night was going to be long.. the group was cautious…",
 "Slowly he crawled to the other side of the camp, where a pile of logs was located, this would be his hiding spot for now…",
 "Ben entered the tent, and as the screen fell shut behind him… The ghost took his chance…",
 "*Lilly gets up and walks towards the tent. Pressing her finger against her lips, she signals the rest to stay quiet.*",
 "*Lilly Grabs the side of the tent sail, and…..*",
 "*As Lilly lifts the tent sail she reveals... no one...",
 "*gasp* Ben?!",
 "*Lilly falls down on her knees*... Ben... Where... Why...",
 "The... Game... *Lilly murmurs under her breath*",
 "*Lilly's face has turned to an ash-grey tone, her eyes almost glass...",
 "*Lilly turns to face mike*",
 "*Lilly turns to face you*",
 "Thanks for keeping my story alive... "],
"Mike": ["The forest was cursed!",
 "Ehh, The forest was cursed… and known for the many people that disappeared there when the sun was down.",
 "Once turned to its will.. there was nothing in their heads.. but KILL.",
 "Mike does the tent!",
 "Lurking between the trees the ghost saw the group, enjoying their night in the forest…",
 "But she just stood up to grab a marshmallow from Sarah, and the ghost missed her by a hair…",
 "Suddenly the ghost saw that Sarah stood up and headed towards the edge of the campsite",
 "As Lilly disappeared into the shadows of the trees…",
 "The ghost started shifting around the campsite, looking for a good hiding place…",
 "No one noticed him crawling through the camp.. it wouldn’t take long for the next victim to get caught…",
 "*Starts giggling, aware of the Lilly's plan*",
 "Aight Ben, stop fooling around, we know you are there… Or did you just not want to share the marshmallows?...",
 "*Silence...* ",
 "Lilly… your face… what happened?!",
 "No...NO!.. LILLY NO! LEAVE ME ALONE!"], 
"Ben": ["The people that disappeared , were never found, not even their bones..",
 "Can I get a sausage please? I am starving..",
 "and uh oh.. People believe that the ghost is looking for a person that would perfectly match his soul, so he could live on forever in these forests.",
 "I will uh.. Poor the drinks!",
 "Two almost invisible eyes reflect a little of the burning fire, but no one noticed…",
 "This was only the beginning",
 "This would be his chance…",
 "Whoa Lilly, calm down, you will awake a bear like this… she probably just went a little further into the forest so she could pee …",
 "The ghost wrapped his claws around her head, it happened so quickly, she didn’t even had the time to breathe in to scream",
 "He checked the tent, but realising they all would enter that tent, he would have too little time…",
 "With Sarah gone, Ben took over the snack preparing… he looked around but couldn't find the bag with marshmallows…",
 "*Ben looks around*",
 "Hey! I am not a softy! I will take a look in the tent, there are more bags of marshmallows, I am sure there are!",
 "*Ben stands up and walks towards the tent, looking for a new bag of Marshmallows*"], 
"Sarah": ["They sat around a campfire, cooking marshmallows and sausages. hmmm…",
 "Sarah is in charge of the snacks!",
 "While all the friends were busy with their assigned tasks, the ghost in the forest woke up…",
 "He reached out his hand to a slim girl…",
 "I uhh, I have to pee.. I will be right back guys! Continue if you like, I will catch up asap!",
 "I will be quick!",
 "*Sarah disappears behind a tree*"]}

var playerTurnTracker = 1
var playerResponseDictionary = {1 : ["1. The friends however were not scared, and together nothing can hurt them!", "2. The group of friends were prepared and ready for an adventure..", "3. The group of friends were suspicious of every shadow and sound"],
 2 : ["1. I would also like a sausage please… As the friends were eating, they divided tasks for everyone's comfort...", "2. One of the friends suggested that they should divide tasks so the camp was kept in good condition for the night...", "One of the friends demanded the others to pick up a task or something bad would happen…"],
 3 : ["1. And then I will keep the fire alive!", "2. Ill go look for some wood", "3. I will brave the woods!... for timber"],
 4 : ["1. The ghost tried to get as close as possible…", "2. The tall creepy ghost observed the group, discovering who was weakest…", "3. The ghost could easily take them all out, one by one, without hesitation..."],
 5 : ["1. The ghost waited, and waited, for a moment he could enter a vulnerable person...", "2. Behind the slim trees the ghost waited for hours...", "3. Observing the group, his mouth started watering, the hunger was unbearable..."],
 6 : ["1. He waited until she was out of sight of the others…", "2. His claws at the ready, his stomach more hungry than ever…", "3. He prepared himself, this one would be quick…"],
 7 : ["1. He entered her mind, quicker than ever before...", "2. The Ghost slid into her skull, feasted on her brains and soul, this was the only meal he had had in a long while…", "3. Without a doubt he absorbed her and made sure there was nothing left of her to find, not a hair, not a nail…"],
 8 : ["1. I always thought Sarah was a little weird, but hey she says she is alright", "2. Hmm strange, but I guess it is ok…", "3. *Look around concerned*"],
 9 : ["1. He didn’t want to freak them out so soon, he would miss out on precious sustenance…", "2. He looked further into the camp, but nothing sufficed, so he retreated to the tree lines.", "3. His hunger wouldn’t allow him to leave just yet… he must find a better spot to hide…"],
 10: ["1. The Ghost noticed his behaviour, and followed where his eyes would go…", "2. The Ghost stayed in lockstep with every movement, ready to jump the next one…", "3. Ben would be stupid if he started walking around now…"],
 11: ["1. *Sit in silence, nervously waiting to see Ben return from the tent*", "2.  ", "3. "],
 12: ["1. I am worried that this is going too far…", "2. I want to stop this stupid game… ", "3. "]}

var textTimer
var sentenceTime = 5	

func _ready():
	textTimer = Timer.new()
	textTimer.connect("timeout", self, "on_textTimer_timeOut")
	add_child(textTimer)
	textTimer.start(sentenceTime)
	playerCharacterReference = get_node("../../../..")
	pass # Replace with function body.

#func _process(delta):
	
	#pass

func on_textTimer_timeOut():
	nextStoryBeat()
	textTimer.set_wait_time(sentenceTime)
	textTimer.start()
	pass


func updateText(Speaker, newText):
	set_text(Speaker)
	newline()
	add_text(newText)
	pass
	
func nextStoryBeat():
	var i = nextPerson[x]
	if(person[i] == "Lilly"):
		updateText(person[i], speakerDictionary["Lilly"][arrayPosLilly])
		arrayPosLilly += 1
	elif(person[i] == "Mike"):
		updateText(person[i], speakerDictionary["Mike"][arrayPosMike])
		arrayPosMike += 1
	elif(person[i] == "Ben"):
		updateText(person[i], speakerDictionary["Ben"][arrayPosBen])
		arrayPosBen += 1
	elif(person[i] == "Sarah"):
		updateText(person[i], speakerDictionary["Sarah"][arrayPosSarah])
		arrayPosSarah += 1
	elif(person[i] == "You"):
		print_debug("Player says something")
		playerResponseChoice()
		
	x += 1
	pass

func playerResponseChoice():
	textTimer.set_paused(true)
	set_text("You")
	newline()
	add_text(playerResponseDictionary[playerTurnTracker][0])
	newline()
	add_text(playerResponseDictionary[playerTurnTracker][1])
	newline()
	add_text(playerResponseDictionary[playerTurnTracker][2])
	playerCharacterReference.chooseNarrativeOption = true
	pass

func playersChoice(choice):
	updateText("You", playerResponseDictionary[playerTurnTracker][choice])
	playerTurnTracker += 1
	textTimer.set_wait_time(sentenceTime)
	textTimer.set_paused(false)
	pass
