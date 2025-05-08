extends CharacterBody2D
class_name Enemigo

@export var vida : int = 15

func herir(damage : int):
	vida-=damage
	
	if vida<=0:
		morir()
	
func morir():
	queue_free() 
