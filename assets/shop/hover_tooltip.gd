extends Panel
	
@onready var Name = $Panel/Name
@onready var Des = $Panel2/Des
@onready var Price = $Panel3/Price


func _ready() -> void:
	visible = false

func _process(_delta: float) -> void:
	position = get_viewport().get_mouse_position()
	var mouse_pos = get_global_mouse_position()
	var query = PhysicsPointQueryParameters2D.new()
	query.position = mouse_pos
	query.collide_with_areas = true
	query.collide_with_bodies = true
	var space_state = get_world_2d().direct_space_state
	var result = space_state.intersect_point(query)
	var hovered = false
	for hit in result:
		if hit["collider"] is Hoverable and hit["collider"].visible:
			hovered = true
			visible = true
			Name.text = itemDic.items[hit["collider"].itemi]["Name"]
			Des.text = itemDic.items[hit["collider"].itemi]["Des"]
			Price.text = str("Price: ",itemDic.items[hit["collider"].itemi]["Price"])
			#print("Hoverable detected",hit["collider"].name)
	if not hovered:
		visible = false

	
	
