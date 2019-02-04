extends Node2D

func _ready():
	var prompt = ["Yann", "pizza", "feeling", "feeling", "feeling"]
	var story = "Once upon a time a %s ate a %s  and felt very %s. %s %s"
	$Blackboard/StoryText.text = (story % prompt)
#	$Blackboard/StoryText.bbcode_text = (story % prompt)
	$Blackboard/TextBox.text = ""

func _on_TextureButton_pressed():
	var text = $Blackboard/TextBox.text
	_on_TextBox_text_entered(text)

func _on_TextBox_text_entered(new_text):
	$Blackboard/StoryText.bbcode_text = new_text
	$Blackboard/TextBox.text = ""
