extends Enemigo
@export var hitbox: Area2D

@onready var posicion_inicial: Vector2 = position
@onready var jugador: Node2D = null

var distancia: float = 100
var velocidad: float = 20000
var direccion: Vector2 = Vector2(1, 0)
var persiguiendo_jugador: bool = false

func _ready():
	for nodo in get_tree().get_nodes_in_group("Jugador"):
		jugador = nodo
	
	$Timer.wait_time = 5.0
	$Timer.start()

func _physics_process(delta: float) -> void:
	if persiguiendo_jugador and jugador:
		direccion = position.direction_to(jugador.global_position)
	else:
		if position.distance_to(posicion_inicial) >= distancia:
			direccion = position.direction_to(posicion_inicial)

	velocity = direccion * velocidad * delta
	move_and_slide()

func _on_timer_timeout():
	persiguiendo_jugador = true
	await get_tree().create_timer(2.0).timeout
	persiguiendo_jugador = false

func _on_timer_ataque_timeout():
	for cuerpo in hitbox.get_overlapping_bodies():
		if cuerpo.is_in_group("Jugador"):
			cuerpo.herir(100)
