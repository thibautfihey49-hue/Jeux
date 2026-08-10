extends CharacterBody3D

@export var speed: float = 6.0
@export var jump_force: float = 4.2
@export var gravity: float = 9.8

func _physics_process(delta):
	var dir = Vector3.ZERO
	if Input.is_action_pressed("move_forward"):
		dir -= transform.basis.z
	if Input.is_action_pressed("move_backward"):
		dir += transform.basis.z
	if Input.is_action_pressed("move_left"):
		dir -= transform.basis.x
	if Input.is_action_pressed("move_right"):
		dir += transform.basis.x
	
	dir = dir.normalized()
	velocity.x = dir.x * speed
	velocity.z = dir.z * speed
	
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = jump_force
	
	if not is_on_floor():
		velocity.y -= gravity * delta
	
	move_and_slide()
