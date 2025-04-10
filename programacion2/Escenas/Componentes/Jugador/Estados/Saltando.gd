extends Estado

func enter():
	jugador.sprite.play("Saltando")
	jugador.velocity.y = -100

func physics_update(delta):
	if jugador.velocity.y < 0:
		jugador.velocity.y += jugador.gravedad_subida
	else:
		jugador.velocity.y += jugador.gravedad_caida

	var direccion = Input.get_axis("mov_izquierda", "mov_derecha")

	if direccion == 0:
		jugador.velocity.x = 0
	else:
		jugador.velocity.x = direccion * jugador.velocidad
		jugador.sprite.flip_h = direccion < 0

	jugador.move_and_slide()

	if jugador.velocity.y > 0:
		get_parent().siguiente_estado("Cayendo")

	if jugador.is_on_floor():
		get_parent().siguiente_estado("Quieto")
