extends Node2D

@export var fish_scene: PackedScene  # 魚的預載場景
@export var fish_count: int = 5  # 初始魚的數量

func _ready():
	randomize()
	_spawn_fish()

func _spawn_fish():
	var aquarium_size = get_viewport_rect().size  # 取得水族箱大小

	for i in range(fish_count):
		var fish = fish_scene.instantiate()  # 建立魚
		fish.position = Vector2(
			randf_range(50, aquarium_size.x - 50),
			randf_range(50, aquarium_size.y - 50)
		)  # 隨機位置

		get_node("FishContainer").add_child(fish)  # 加入場景
