extends Node3D




	


func _on_gamba_interacted(body: Variant) -> void:
	Global.game_controller.current_3d_scene.visible = false
	Global.game_controller.current_gui_scene = get_node("../../GUI/gambaMain")
	Global.game_controller.current_gui_scene.visible = true

func _on_tavern_keep_interacted(body: Variant) -> void:
	Global.game_controller.current_3d_scene.visible = false
	Global.game_controller.current_gui_scene = get_node("../../GUI/shop")
	Global.game_controller.current_gui_scene.visible = true
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _on_visibility_changed() -> void:
	if visible:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	pass # Replace with function body.
