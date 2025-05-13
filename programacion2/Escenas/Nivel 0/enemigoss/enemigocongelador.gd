extends Enemigo
@export var hitbox: Area2D

@onready var posicion_inicial : Vector2 = position
var distancia : float = 100
var velocidad : float = 20000
var direccion : Vector2 = Vector2(1, 0)

func _physics_process(delta: float) -> void:
	velocity = direccion * velocidad * delta
	if position.distance_to(posicion_inicial) >= distancia:
		direccion = position.direction_to(posicion_inicial)
	move_and_slide()

func _on_timer_ataque_timeout():
	for cuerpo in hitbox.get_overlapping_bodies():
		if cuerpo.is_in_group("Jugador"):
			if cuerpo.has_method("congelar"):
				cuerpo.congelar(5.0)  
