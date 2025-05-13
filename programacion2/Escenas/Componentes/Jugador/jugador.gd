extends CharacterBody2D
@export var velocidad = 8000.0
@export var gravedad = 750.0
@export var sprite : AnimatedSprite2D
@export var hud: Control
@export var impulso_salto : float = 500

var vida: int
var max_vida: int = 500
var magia: int
var max_magia: int = 10
var monedas: int = 999

var congelado := false
var tiempo_congelado := 0.0

func _ready():
	inicializar_jugador()
	actualizar_hud()
	Globales.jugador = self
	add_to_group("Jugador")
	await get_tree().process_frame
	monedas = Globales.save_manager.datos_guardado.monedas

func _physics_process(_delta):
	if congelado:
		tiempo_congelado -= _delta
		if tiempo_congelado <= 0:
			congelado = false
		return  # No moverse si está congelado

	actualizar_hud()
	move_and_slide()

func inicializar_jugador():
	vida = max_vida
	magia = max_magia
	monedas = 0

func morir():
	queue_free()

func herir(cantidad: int):
	vida -= cantidad
	if vida <= 0:
		morir()

func actualizar_hud():
	hud.vida = vida
	hud.vidaMax = max_vida
	hud.magia = magia
	hud.magiaMax = max_magia
	hud.monedas = monedas
	hud.actualizar_valores()

func congelar(segundos: float) -> void:
	congelado = true
	tiempo_congelado = segundos
