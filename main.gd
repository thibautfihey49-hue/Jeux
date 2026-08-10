extends Node3D

@onready var world = $World
@onready var player = $Player
@onready var camera = $Camera

func _ready():
	world.generate_world(64, 64)
	print("🌍 Monde généré — Prêt à explorer !")

func _process(delta):
	if player and camera:
		var target = player.global_position + Vector3(0, 8, -14)
		camera.global_position = camera.global_position.lerp(target, 0.05)
		camera.look_at(player.global_position + Vector3(0, 1.5, 0), Vector3.UP)
