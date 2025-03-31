extends Node2D

@export var fish_scene: PackedScene
@export var backgrounds: Array[Texture2D] = []
var current_bg_index := 0
var bg_sprite: Sprite2D

func _ready():
	# 先創建背景（會被繪製在底層）
	_setup_background()
	
	# 然後創建魚（會繪製在背景之上）
	#_setup_fish()
	
	# 最後創建UI（會繪製在最上層）
	_setup_ui()

func _setup_background():
	bg_sprite = Sprite2D.new()
	bg_sprite.texture = backgrounds[current_bg_index] if backgrounds.size() > 0 else null
	bg_sprite.centered = false
	bg_sprite.z_index = -1  # 確保背景在最後面
	add_child(bg_sprite)
	_resize_background()

#func _setup_fish():
	## 魚的z_index默認為0，會在背景(-1)和UI(1)之間
	#for i in range(5):  # 生成5條魚
		#var fish = fish_scene.instantiate()
		#fish.position = Vector2(
			#randf_range(50, get_viewport_rect().size.x - 50),
			#randf_range(50, get_viewport_rect().size.y - 50)
		#add_child(fish)

func _setup_ui():
	var button = Button.new()
	button.text = "切換背景"
	button.position = Vector2(20, 20)
	button.z_index = 1  # UI在最前面
	button.pressed.connect(_on_bg_button_pressed)
	add_child(button)

func _on_bg_button_pressed():
	if backgrounds.size() == 0:
		return
	
	current_bg_index = (current_bg_index + 1) % backgrounds.size()
	bg_sprite.texture = backgrounds[current_bg_index]
	_resize_background()

func _resize_background():
	if bg_sprite.texture:
		var viewport_size = get_viewport_rect().size
		var texture_size = bg_sprite.texture.get_size()
		bg_sprite.scale = Vector2(
			viewport_size.x / texture_size.x,
			viewport_size.y / texture_size.y
		)

func _on_viewport_size_changed():
	_resize_background()
