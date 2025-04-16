extends Control
class_name Gamba

@onready var odds = get_parent().odds
var rollnum = 0


signal roll
signal griddone


func make_rollgrid():
	var rollgrid = []
	for i in range(0,5):
		rollgrid.append(get_child(i).rolli)
	print("rollgrid: ",rollgrid)
	return(rollgrid)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print("odds: ",odds)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Global.game_controller.current_gui_scene == get_node("../../") and Global.game_controller.current_gui_scene.visible:
		if Input.is_action_just_pressed("ui_accept"):
			roll.emit()

	
func _on_column_4_rolled() -> void: 
	griddone.emit(make_rollgrid())
