extends Node2D

func _ready():
	var prompt = ["Yann", "pizza", "feeling", "feeling", "feeling"]
	var story = "Once upon a time a %s ate a %s  and felt very %s. %s %s"
	print(story % prompt)