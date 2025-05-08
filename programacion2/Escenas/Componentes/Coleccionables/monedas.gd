extends Collecionable

func coleccionado():
	Globales.jugador.monedas+=1
	queue_free()
