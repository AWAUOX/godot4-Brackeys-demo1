extends Node


var score = 0

@onready var score_label = $Score_Label

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	

func Count_Score():
	score += 1
	
	score_label.text = "you have collect " + str(score) + " coins!"
	
	print("the score is:")
	print(score)
