extends RayCast3D

@onready var prompt = $Prompt

func _ready() -> void:
	prompt.text = ""

func _physics_process(_delta: float) -> void:
	prompt.text = ""
	if Global.game_controller.current_3d_scene.visible:
		if is_colliding():
			var collider = get_collider()
			if collider is Interactable:
				prompt.text = collider.prompt_message
				
				if Input.is_action_just_pressed(collider.prompt_input):
					collider.interact(owner)
					pass
