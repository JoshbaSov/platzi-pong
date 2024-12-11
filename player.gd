extends CharacterBody2D

const BASE_SPEED = 400.0
const ACCELERATION = 100.0  # Incremento por cada 0.1 segundos
const ACCELERATION_TIME = 0.1  # Tiempo necesario para incrementar velocidad

var speed = BASE_SPEED
var hold_time = 0.0  # Tiempo acumulado de mantener el botón presionado

func _physics_process(delta):
	var direction = Input.get_axis("ui_up", "ui_down")

	if direction != 0:
		# Incrementar el tiempo de pulsación
		hold_time += delta
		if hold_time >= ACCELERATION_TIME:
			speed += ACCELERATION
			hold_time = 0.0  # Reiniciar el contador para la siguiente aceleración
	else:
		# Reiniciar velocidad y contador cuando no se presiona ninguna dirección
		speed = BASE_SPEED
		hold_time = 0.0

	velocity.y = direction * speed

	move_and_slide()
