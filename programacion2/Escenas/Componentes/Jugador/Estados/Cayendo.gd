extends Estado

func enter():
	jugador.sprite.play("Cayendo")

func physics_update(delta):
	jugador.velocity.y += jugador.gravedad_caida
	jugador.move_and_slide()

	if jugador.is_on_floor():
		get_parent().siguiente_estado("Quieto")
