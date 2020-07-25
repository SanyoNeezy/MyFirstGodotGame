extends KinematicBody2D

var score : int = 0

var speed : int = 200
var jumpforce : int = 600
var gravity : int = 800

# Vector2 ist ein Vektor, der 2 Werte halten kann
var velocity : Vector2 = Vector2()


#onready --> wird aufgerufen, sobald die Szene gestartet wird
onready var sprite : Sprite = get_node("Sprite")

#built-in function of KinematicBody2D
func _physics_process(delta):
	velocity.x = 0

		####	Move left and right	####	
	#Input.is_action_just_pressed: wird im ersten Frame des Tastendrucks aufgerufen
	#Input.is_action_just_release: wird im ersten Frame des Loslassens aufgerufen
	#Input.is_action_pressed wird während jedem frame des tastendrucks ausgelöst
	if Input.is_action_pressed("move_left"):
		velocity.x -= speed
	if Input.is_action_pressed("move_right"):
		velocity.x += speed

		####	gravity		####
	#Die Funktion physics process wird in jedem Frame aufgerufen. Das Spiel läuft auf 60 fps.
	#Delta erhält den Wert 1/fps
	velocity.y += gravity * delta
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y -= jumpforce
	
	#move_and_slide ist eine eingebaute Funktion in KinematicBody2D und erwartet eine 
	#Geschwindigkeit, sowie die RIchtung "oben"
	#Vector2.UP ist eine Konstante mit den Werten (0,1)
	velocity = move_and_slide(velocity, Vector2.UP)
	
	#horizontal sprite-	flip on turnaround
	if velocity.x < 0:
		sprite.flip_h = true
	elif velocity.x > 0 :
		sprite.flip_h = false
	
