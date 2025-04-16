extends Node
class_name GameController 
	
@export var world_2d : Node2D
@export var world_3d : Node3D
@export var gui : Control

var current_3d_scene
var current_2d_scene
var current_gui_scene

func change_gui_scene(new_scene: String, delete: bool = true, keep_running: bool = false) -> void:
	if current_gui_scene != null:
		if delete:
			current_gui_scene.queue_free()
		elif keep_running:
			current_gui_scene.visible = false
		else:
			gui.remove_child(current_gui_scene)
	var new = load(new_scene).instantiate()
	gui.add_child(new)
	current_gui_scene = new
	
	
func change_3d_scene(new_scene: String, delete: bool = true, keep_running: bool = false) -> void:
	if current_3d_scene != null:
		if delete:
			current_3d_scene.queue_free()
		elif keep_running:
			current_3d_scene.visible = false
		else:
			world_3d.remove_child(current_3d_scene)
	var new = load(new_scene).instantiate()
	world_3d.add_child(new)
	current_3d_scene = new
	
	
func change_2d_scene(new_scene: String, delete: bool = true, keep_running: bool = false) -> void:
	if current_2d_scene != null:
		if delete:
			current_2d_scene.queue_free()
		elif keep_running:
			current_2d_scene.visible = false
		else:
			world_2d.remove_child(current_2d_scene)
	var new = load(new_scene).instantiate()
	world_2d.add_child(new)
	current_2d_scene = new
	
func _ready() -> void:
	Global.game_controller = self
	Global.game_controller.change_3d_scene("res://assets/bar3d/bar3d.tscn")
	Global.game_controller.change_gui_scene("res://assets/gamba/gamba_main.tscn",false,true)
	Global.game_controller.change_gui_scene("res://assets/shop/shop.tscn", false, true)
	Global.game_controller.current_gui_scene.visible = false
