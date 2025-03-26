extends Button


## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
	
@export var background_textures: Array[Texture]  # 存多張背景圖
var current_bg_index = 0

func _on_change_background_pressed():
	current_bg_index = (current_bg_index + 1) % background_textures.size()
	$Background.texture = background_textures[current_bg_index]
