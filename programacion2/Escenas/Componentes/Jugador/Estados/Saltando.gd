extends Estado

func enter():
	jugador.sprite.play("Saltando")
	jugador.velocity.y = -jugador.impulso_salto

func physics_update(delta):
	jugador.velocity.y += jugador.gravedad*delta
	
	var direccion = Input.get_axis("mov_izquierda", "mov_derecha")

	if direccion == 0:
		jugador.velocity.x = 0
	else:
		jugador.velocity.x = direccion * jugador.velocidad * delta
		jugador.sprite.flip_h = direccion < 0

	jugador.move_and_slide()

	if jugador.velocity.y > jugador.gravedad:
		get_parent().siguiente_estado("Cayendo")

	if jugador.is_on_floor():
		get_parent().siguiente_estado("Quieto")
