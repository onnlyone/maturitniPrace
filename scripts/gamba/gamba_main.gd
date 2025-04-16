extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		Global.game_controller.current_3d_scene.visible = true
		Global.game_controller.current_gui_scene.visible = false
		pass
