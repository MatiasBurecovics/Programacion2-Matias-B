extends Estado
@export var attack_hitbox : Area2D

func enter():
	jugador.sprite.play("Atacando")
	
	for cuerpo in attack_hitbox.get_overlapping_bodies():
		if cuerpo.is_in_group("Enemigos"):
			cuerpo.herir(10)

func physics_update(delta):
	jugador.velocity.x = 0
	jugador.move_and_slide()

	if not jugador.sprite.is_playing():
		get_parent().siguiente_estado("Quieto")
