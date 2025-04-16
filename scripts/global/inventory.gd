extends Control 
class_name Inventory

var inv = {
	0: {"Have": false, "Count": 0},
	1: {"Have": false, "Count": 0},
	2: {"Have": false, "Count": 0},
	3: {"Have": false, "Count": 0},
	4: {"Have": false, "Count": 0},
	5: {"Have": false, "Count": 0},
	6: {"Have": false, "Count": 0},
	7: {"Have": false, "Count": 0},
	8: {"Have": false, "Count": 0},
	9: {"Have": false, "Count": 0},
	10: {"Have": false, "Count": 0},
	11: {"Have": false, "Count": 0},
	12: {"Have": false, "Count": 0},
	13: {"Have": false, "Count": 0},
	14: {"Have": false, "Count": 0},
	15: {"Have": false, "Count": 0},
	16: {"Have": false, "Count": 0},
	
}

func _ready() -> void:
	Global.inventory = self
