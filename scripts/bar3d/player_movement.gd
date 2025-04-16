extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var sitting = false

@onready var neck := $Neck
@onready var camera := $Neck/Camera3D
@onready var interactionRay := $Neck/InteractionRay


func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	velocity.y = 0

	
func _on_chair_sit(body: Variant) -> void:
	sitting = true
	if sitting:
		position = body + Vector3(0,1.5,0)
		pass
		
		

func _input(event:InputEvent):
	if sitting and event.is_action_pressed("ui_cancel"):
		sitting = false


func _unhandled_input(event: InputEvent) -> void:
	if Global.game_controller.current_3d_scene.visible:
		if event is InputEventMouseButton:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		elif event.is_action_pressed("ui_cancel"):
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			if event is InputEventMouseMotion:
				neck.rotate_y(-event.relative.x * 0.005)
				camera.rotate_x(-event.relative.y * 0.005)
				interactionRay.rotate_x(-event.relative.y * 0.005)
				camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(60))
				interactionRay.rotation.x = clamp(camera.rotation.x, deg_to_rad(-60), deg_to_rad(60))




func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Global.game_controller.current_3d_scene.visible:
		if Input.is_action_just_pressed("ui_accept") and is_on_floor():
			velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("left", "right", "forward", "back")
	var direction =(neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)
	#print(position)
	#print(velocity.y)
	#print(get_gravity())
	if Global.game_controller.current_3d_scene.visible:
		move_and_slide()
		#print(position)
		#print(velocity.y)
		#print(get_gravity())
