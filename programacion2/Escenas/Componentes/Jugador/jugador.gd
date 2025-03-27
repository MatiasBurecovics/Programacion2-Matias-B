extends CharacterBody2D
@export var velocidad = 200.0
@export var gravedad=550.0
@export var sprite : AnimatedSprite2D


func _physics_process(_delta):
	pass

	move_and_slide()
