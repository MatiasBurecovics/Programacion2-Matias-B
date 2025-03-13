extends CharacterBody2D
var velocidad = 200

func _physics_process(delta):
	var direccion=Input.get_axis("mov_izquierda","mov_derecha")
	velocity.x=direccion*velocidad
	move_and_slide()
