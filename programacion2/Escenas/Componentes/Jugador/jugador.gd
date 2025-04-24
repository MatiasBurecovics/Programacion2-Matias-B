extends CharacterBody2D
@export var velocidad = 8000.0
@export var gravedad=750.0
@export var sprite : AnimatedSprite2D
@export var hud: Control
@export var impulso_salto : float = 500

var vida: int
var max_vida: int=500
var magia: int
var max_magia: int = 10
var monedas: int


func _ready():
	inicializar_jugador()
	actualizar_hud()

func _physics_process(_delta):
	pass
	

func inicializar_jugador():
	vida=max_vida
	magia=max_magia
	monedas=0


func morir():
	queue_free()


func herir(cantidad: int):
	vida-=cantidad
	if vida<=0:
		morir()

func actualizar_hud():
	hud.vida=vida
	hud.vidaMax=max_vida
	hud.magia=max_magia
	hud.magiaMax=max_magia
	hud.monedas=monedas
	hud.actualizar_valores()
	
	move_and_slide()
