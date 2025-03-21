extends Node2D

@export var speed: float = 20.0  # 魚的移動速度
@export var move_time: float = 5.0  # 每次移動的時間

var direction: int  # 移動方向 (-1=左, 1=右)
var target_x: float  # 目標 X 座標
var tween: Tween  # Tween 動畫物件

func _ready():
	randomize()
	direction = [-1, 1].pick_random()  # 隨機選擇向左或向右
	_start_moving()
	
	$AnimatedSprite2D.play()

func _start_moving():
	# 取得水族箱大小（假設水族箱是父節點）
	var aquarium_size = get_parent().get_viewport_rect().size

	# 計算新的目標 X 座標，確保不超出範圍
	target_x = clamp(
		position.x + direction * randf_range(100, 300),  # 隨機游一段距離
		50, aquarium_size.x - 50  # 限制在水族箱內
	)

	# 讓魚面向移動方向
	scale.x = direction  # 左右翻轉魚的圖片

	# 平滑移動
	if tween:
		tween.kill()
	tween = create_tween()
	tween.tween_property(self, "position:x", target_x, move_time).set_trans(Tween.TRANS_LINEAR)
	
	#$AnimatedSprite2D.play()

	# 等待動畫結束後繼續
	await tween.finished
	
	# 反轉方向
	direction *= -1
	_start_moving()
	
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	#pass # Replace with function body.
	if event is InputEventMouseButton and event.pressed:
		queue_free()  # 點擊後刪除魚
