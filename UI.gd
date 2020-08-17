extends Control

onready var scoreText_Label = get_node("ScoreText")

# Called when the node enters the scene tree for the first time.
func _ready():
	scoreText_Label.text = "0"

func set_score_text(score) :
	scoreText_Label.text = str (score)
