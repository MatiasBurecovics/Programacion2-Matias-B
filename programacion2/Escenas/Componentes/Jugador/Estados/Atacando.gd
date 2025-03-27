extends Estado

func enter():
	jugador.sprite.play("Atacando")  

func physics_update(delta):
	
	jugador.velocity.x = 0  
	jugador.move_and_slide()
	
	if not jugador.sprite.is_playing():
		get_parent().siguiente_estado("Quieto")
