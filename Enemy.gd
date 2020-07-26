extends Area2D

export var speed : int = 100
export var moveDist : int = 100

onready var startX : int = position.x

onready var targetX : int = position.x + moveDist

func move_to (current, to, step):
	
	var new = current
	
	if new < to:
		new += step
		if new > to:
			new = to
	else:
		new -= step
		if new < to:
			new = to
	
	return new
	


# gets calles once every frame	(unlike func _physics_process(delta):)
#func _process(delta):
	 
