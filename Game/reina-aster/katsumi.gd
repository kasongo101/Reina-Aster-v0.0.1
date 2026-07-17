extends CharacterBody2D


const SPEED = 2000.0
const JUMP_VELOCITY = -400.0
const ACCCELRATION = 10.0
const FRICTION = 100.0


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	#If you press the key, smoothly accelerate towards top speed. 
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = move_toward(velocity.x, direction * SPEED, ACCCELRATION)
	else:
		velocity.x = move_toward(velocity.x, 0, FRICTION)

	move_and_slide()
