extends Node2D

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#pass # Replace with function body.
	#$Sprite2D/AnimationPlayer.play("Sprite2D")
	$AnimationPlayer.play("new_animation")
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass
