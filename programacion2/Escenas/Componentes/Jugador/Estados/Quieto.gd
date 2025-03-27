extends Estado

func enter():
	jugador.sprite.play("Quieto")
	

func physics_update(_delta):
	jugador.velocity.y = jugador.gravedad
	jugador.move_and_slide()
	
	if jugador.is_on_floor() and Input.is_action_just_pressed("mov_izquierda") or ("mov_derecha"):
		get_parent().siguiente_estado("Corriendo")
	
	if jugador.is_on_floor() and Input.is_action_just_pressed("salto"):
		get_parent().siguiente_estado("Saltando")
	
	if not jugador.is_on_floor():
		get_parent().siguiente_estado("Cayendo")
