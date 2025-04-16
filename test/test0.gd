extends Node

func _process(delta: float) -> void:
	for child in get_children():
		print("Child:", child.name)
	if get_children() == []:
		print("empty")
