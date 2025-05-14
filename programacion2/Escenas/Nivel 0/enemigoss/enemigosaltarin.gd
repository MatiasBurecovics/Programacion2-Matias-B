extends Enemigo
class_name EnemigoSaltarin

@export var fuerza_salto: float = -500.0
@export var gravedad: float = 900.0
@export var tiempo_entre_saltos: float = 2.0
@onready var hitbox: Area2D = $Hitbox2

@onready var timer_salto: Timer = $Timer

func _ready():
	timer_salto.wait_time = tiempo_entre_saltos
	timer_salto.start()
	hitbox.body_entered.connect(_on_hitbox_body_entered)

func _physics_process(delta: float) -> void:
	velocity.y += gravedad * delta
	move_and_slide()

func _on_Timer_timeout():
	if is_on_floor():
		velocity.y = fuerza_salto

func _on_hitbox_body_entered(body: Node2D):
	if velocity.y > 0 and body.is_in_group("Jugador"):
		body.herir(50)
		print("Jugador dañado por salto del enemigo")
