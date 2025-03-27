extends CharacterBody2D
@export var velocidad = 200

func _physics_process(delta):
	var direccion_x =Input.get_axis("mov_izquierda","mov_derecha")
	var direccion_y = Input.get_axis("mov_arriba", "mov_abajo")
	velocity.x=direccion_x * velocidad
	velocity.y = direccion_y * velocidad
	move_and_slide()
