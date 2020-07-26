extends Area2D

#export --> erscheint im Inspector und hat default value von 1 - jede Coin kann eigenen Value erhalten
export var value : int = 1
var rotationSpeed : float = 90.0

# wird jeden frame aufgerufen
func _process(delta):
	# wenn rotationSpeed 90 ist, wird 90 * pro Sekunde gedreht
	rotation_degrees += rotationSpeed * delta
	


func _on_Coin_body_entered(body):
	if body.name == "Player":
		body.collect_coin(value)
		queue_free()
