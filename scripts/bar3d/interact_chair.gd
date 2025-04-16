extends Interactable

signal sit(body)

func _on_interacted(body):
	body = position
	print(position)
	sit.emit(body)
	
