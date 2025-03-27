extends Node2D

@export var background_sprites: Array[Texture]  # 存放背景圖片
var current_bg_index: int = 0  # 當前背景索引

@export var fish_scene: PackedScene  # 魚的預載場景
@export var fish_count: int = 5  # 初始魚的數量

#var aquarium_size = $AquariumContainer.get_rect().size

func _ready():
	randomize()
	_spawn_fish()
	
	# 讓 Godot 偵測滑鼠點擊
	set_process_input(true)
	
	#set_gravity_scale(0)  # 取消重力影響



func change_background():
	if background_sprites.size() == 0:
		return  # 沒有背景則不執行

	# 切換到下一個背景
	current_bg_index = (current_bg_index + 1) % background_sprites.size()
	$Background.texture = background_sprites[current_bg_index]  # 更新背景
	
	
func _spawn_fish():
	var aquarium_size = get_viewport_rect().size  # 取得水族箱大小

	for i in range(fish_count):
		_add_fish(Vector2(
			randf_range(50, aquarium_size.x - 50), # 避免超出邊界
			randf_range(100, aquarium_size.y - 100) # ✅ 確保 Y 軸不貼在上方
		))  # 隨機位置

func _add_fish(_position: Vector2):
	var fish = fish_scene.instantiate()  # 建立魚
	fish.position = position  # 設定位置
	
	#fish.position = Vector2(random_x, random_y)
	get_node("FishContainer").add_child(fish)  # 加入場景

 
func _input(event): #處理滑鼠點擊
	if event is InputEventMouseButton and event.pressed:
		_add_fish(event.position)  # 在滑鼠點擊位置新增魚
