extends Control
var vida=47
var vidaMax=100
var magia=24
var magiaMax=80
var monedas=1076

@onready var barraVida=$MarginContainer/BarrasContainer/VidaContainer/ProgressBar
@onready var textoVida=$MarginContainer/BarrasContainer/VidaContainer/Label

@onready var barraMagia=$MarginContainer/BarrasContainer/MagiaContainer/ProgressBar2
@onready var textoMagia=$MarginContainer/BarrasContainer/MagiaContainer/Label

@onready var textoMonedas=$MarginContainer/MonedasContainer/Label

func _ready():
	barraVida.max_value=vidaMax
	barraMagia.max_value=magiaMax

func _process(delta):
	barraVida.value=vida
	textoVida.text=str(vida)
	barraMagia.value=magia
	textoMagia.text=str(magia)
	textoMonedas.text=str(monedas)
