extends Estado

func enter():
	jugador.sprite.play("Corriendo")

func physics_update(delta):
	var direccion = Input.get_axis("mov_izquierda", "mov_derecha") 

	if direccion == 0:  
		jugador.velocity.x = 0
		get_parent().siguiente_estado("Quieto") 
	else:
		jugador.velocity.x = direccion * jugador.velocidad * delta  
		jugador.sprite.flip_h = direccion < 0 

	jugador.move_and_slide()
