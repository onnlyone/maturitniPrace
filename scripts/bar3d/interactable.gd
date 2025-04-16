extends CollisionObject3D
class_name Interactable

signal interacted(body)

@export var prompt_message = "Interact"
@export var prompt_input = "interact"

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	pass


func interact(body):
	interacted.emit(body)
