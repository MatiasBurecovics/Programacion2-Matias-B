extends Estado


func enter():
	jugador.sprite.play("Saltando")

func physics_update(delta):
	if Input.is_action_just_pressed("salto"):
		jugador.velocity.y=-100
		jugador.move_and_slide()
	
	
