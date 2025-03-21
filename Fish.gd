extends Node2D

@export var speed: float = 250.0  # 魚的移動速度
@export var move_time: float = 1.0  # 每次移動的時間

var target_position: Vector2  # 目標位置
var tween: Tween  # Tween 動畫物件

func _ready():
	randomize()
	_start_moving()

func _start_moving():
	# 取得水族箱大小（假設水族箱是父節點）
	var aquarium_size = get_parent().get_viewport_rect().size

	# 隨機選擇一個目標位置
	target_position = Vector2(
		randf_range(50, aquarium_size.x - 50),
		randf_range(50, aquarium_size.y - 50)
	)

	# 讓魚面向移動方向
	look_at(target_position)

	# 使用 Tween 平滑移動
	if tween:
		tween.kill()  # 停止舊的 Tween
	tween = create_tween()
	tween.tween_property(self, "position", target_position, move_time).set_trans(Tween.TRANS_LINEAR)

	# 動畫完成後再找下一個位置
	await tween.finished
	_start_moving()
