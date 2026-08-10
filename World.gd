extends Node3D

var tiles = []

func generate_world(size_x: int, size_z: int):
	for t in tiles:
		t.queue_free()
	tiles.clear()
	
	for x in range(-size_x/2, size_x/2):
		for z in range(-size_z/2, size_z/2):
			var h = sin(x*0.12)*cos(z*0.12)*2 + sin(x*0.05+z*0.08)
			var tile = MeshInstance3D.new()
			tile.mesh = PlaneMesh.new()
			tile.mesh.size = Vector2(2, 2)
			tile.position = Vector3(x*2, h, z*2)
			add_child(tile)
			tiles.append(tile)
	
	print("✅ Terrain généré: ", size_x, "×", size_z)
