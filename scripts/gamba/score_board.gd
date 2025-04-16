extends Panel

@onready var skore = $Score
@onready var skoreadd = $ScoreAdd




	
func _process(_delta: float) -> void:
	skoreadd.text = str("+",get_node("../gambaSlotmachine").basescore)
	skore.text = str(get_node("../gambaSlotmachine").score)
	
