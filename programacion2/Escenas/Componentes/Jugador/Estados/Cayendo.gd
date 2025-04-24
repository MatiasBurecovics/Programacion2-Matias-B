extends Estado

func enter():
	jugador.sprite.play("Cayendo")

func physics_update(delta):
	jugador.velocity.y += jugador.gravedad*delta
	jugador.move_and_slide()
	
	var direccion =Input.get_axis("mov_izquierda","mov_derecha")
	jugador.velocity.x=direccion*jugador.velocidad * delta
	
	if jugador.is_on_floor():
		get_parent().siguiente_estado("Quieto")
