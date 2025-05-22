extends Enemigo

@onready var hitbox: Area2D = $Hitbox
@onready var raycast: RayCast2D = $RayJugador

@onready var posicion_inicial : Vector2 = position
var distancia : float = 100
var velocidad : float = 20000
var direccion : Vector2 = Vector2(1, 0)

func _physics_process(delta: float) -> void:
	if raycast.is_colliding():
		var objetivo = raycast.get_collider()
		if objetivo.is_in_group("Jugador"):
			velocity = direccion * velocidad * delta
			if position.distance_to(posicion_inicial) >= distancia:
				direccion = position.direction_to(posicion_inicial)
			move_and_slide()
		else:
			velocity = Vector2.ZERO
	else:
		velocity = Vector2.ZERO

func _on_timer_timeout():
	for cuerpo in hitbox.get_overlapping_bodies():
		if cuerpo.is_in_group("Jugador"):
			cuerpo.herir(150)
