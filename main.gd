extends Node

func _ready():
	# 取得按鈕和水族箱
	var button = $UI/ChangeBackgroundButton
	var aquarium = $Aquarium2

	# 檢查是否找到節點，避免 null 錯誤
	if button and aquarium:
		button.pressed.connect(aquarium.change_background)
