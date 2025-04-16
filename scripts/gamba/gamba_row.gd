extends Control
class_name Row1



@onready var anim: AnimatedSprite2D = $AnimatedSprite2D
@export var rownum = int()




func _on_column_1_rolled():
	var rolli = get_parent().rolli
	anim.set_frame_and_progress(rolli[rownum],0)
	
