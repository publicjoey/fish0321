extends Node2D

@export var background_sprites: Array[Texture]  # 存放背景圖片
var current_bg_index: int = 0  # 當前背景索引

func change_background():
	if background_sprites.size() == 0:
		return  # 沒有背景則不執行

	# 切換到下一個背景
	current_bg_index = (current_bg_index + 1) % background_sprites.size()
	$Background.texture = background_sprites[current_bg_index]  # 更新背景
