extends Camera2D

onready var Player = get_node("/root/MainScene/Player")

#wird jeden frame aufgerufen
func _process(delta):
	position.x = Player.position.x
	
