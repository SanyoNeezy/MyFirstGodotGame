extends Area2D

#export macht, dass die Variablen über den Inspector angezeigt und dort
#für jede Instanz einzeln angepasst werden können
export var speed : int = 100
export var moveDist : int = 100

#x of the spawn location
onready var startX : int = position.x
#x of the target location
onready var targetX : int = position.x + moveDist

#moves "current" towards "to" at rate of "step"
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
	


# gets called once every frame	(unlike func _physics_process(delta))
func _process(delta):
	position.x = move_to(position.x, targetX, speed * delta)

	if position.x == targetX:
		if targetX == startX:
			targetX = position.x + moveDist
		else:
			targetX = startX
	 

#wird aufgerufen, sobald ein "body" in enemy 'eintritt' (im gleichen frame ist / sich überlappt)
# ('body' wird der Spieler sein)
func _on_Enemy_body_entered(body):
	if body.name == "Player":
		body.die()
