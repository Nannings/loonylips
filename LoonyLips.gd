extends Node2D

var player_words = []
var template = [
{
	"prompt": ["a name", "a thing", "a feeling", "feeling", "feeling"],
	"story": "Once upon a time a %s ate a %s  and felt very %s. %s %s"
},
{
	"prompt": ["a name", "a thing", "a feeling", "feeling", "feeling"],
	"story": "Story 2 Once upon a time a %s ate a %s  and felt very %s. %s %s"
},
{
	"prompt": ["a name", "a thing", "a feeling", "feeling", "feeling"],
	"story": "Story 3 Once upon a time a %s ate a %s  and felt very %s. %s %s"
},
]
var current_story

func _ready():
	randomize()
	current_story = template[randi() % template.size()]
	$Blackboard/StoryText.text = "welcome, \n Can I have " + current_story.prompt[player_words.size()] + ", please?"
	$Blackboard/TextBox.text = ""
	$Blackboard/TextBox.grab_focus()
	

func _on_TextureButton_pressed():
	if is_story_done():
		get_tree().reload_current_scene()
	else:
		var text = $Blackboard/TextBox.text
		_on_TextBox_text_entered(text)

func _on_TextBox_text_entered(new_text):
	player_words.append(new_text)
	$Blackboard/TextBox.text = ""
	print(player_words)
	check_player_word_length()
	
func is_story_done():
	return player_words.size() == current_story.prompt.size()
	
func prompt_player():
	$Blackboard/StoryText.text = ("Can I have " + current_story.prompt[player_words.size()] + ", please?")

func check_player_word_length():
	if is_story_done():
		tell_story()
	else:
		prompt_player()

func tell_story():
	$Blackboard/StoryText.text = (current_story.story % player_words)
	$Blackboard/TextureButton/ButtonLabel.text = "again"
	end_game()
	
func end_game():
	$Blackboard/TextBox.queue_free()
	pass
