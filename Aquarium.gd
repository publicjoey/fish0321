extends ColorRect  # ✅ 改成 ColorRect，而不是 Node2D

@export var fish_scene: PackedScene  # 魚的預載場景
@export var fish_count: int = 15  # 初始魚的數量

@export var background_textures: Array[Texture]  # 存多張背景圖
var current_bg_index = 0

func _ready():
	randomize()
	#_spawn_fish()
	
	# 讓 Godot 偵測滑鼠點擊
	set_process_input(true)

#func _spawn_fish():
	#var aquarium_size = get_viewport_rect().size  # 取得水族箱大小
#
	#for i in range(fish_count):
		#_add_fish(Vector2(
			#randf_range(50, aquarium_size.x - 50),
			#randf_range(50, aquarium_size.y - 50)
		#))  # 隨機位置
#
#func _add_fish(position: Vector2):
	#var fish = fish_scene.instantiate()  # 建立魚
	#fish.position = position  # 設定位置
	#get_node("FishContainer").add_child(fish)  # 加入場景

# 處理滑鼠點擊
#func _input(event):
	#if event is InputEventMouseButton and event.pressed:
		#_add_fish(event.position)  # 在滑鼠點擊位置新增魚




func _on_button_pressed() -> void:
	#pass # Replace with function body.
	current_bg_index = (current_bg_index + 1) % background_textures.size()
	$Background.texture = background_textures[current_bg_index]
