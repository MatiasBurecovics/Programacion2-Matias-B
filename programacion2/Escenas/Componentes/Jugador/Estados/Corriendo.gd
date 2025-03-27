extends Estado

func enter():
	jugador.sprite.play("Saltando")

func physics_update(delta):
	
	if Input.get_axis("mov_izquierda","mov_derecha"):
		jugador.velocity.x=jugador.velocidad
		jugador.move_and_slide()
		
