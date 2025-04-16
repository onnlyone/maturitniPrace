extends Control
class_name GoalStats

var highScore = 0
var goalRolls = 10
var goalScore = 0
var goalCount = 0
var gold = 0
var goldPT = 5
var goldInterestMax = 5
var goldInterest = 0

signal lost

func goldcalc():
	for i in range(1,goldInterestMax+1):
		if gold >= i * 5:
			gold = gold + 1
	gold = gold + goldPT
	
func _on_gamba_slotmachine_rolled() -> void:
	goalRolls = goalRolls - 1
	print("skibidi")
	if goalRolls == 0:
		if get_node("../gambaSlotmachine").score >= goalScore:
			goldcalc()
			goalRolls = 10
			goalScore = ceil(goalScore * 1.2) + 10
			goalCount = goalCount + 1
		else:
			if highScore < get_node("../gambaSlotmachine").score:
				highScore = get_node("../gambaSlotmachine").score
			
			goalRolls = 10
			goalScore = 0
			goalCount = 0
			gold = 0
			goldPT = 5
			goldInterestMax = 5
			goldInterest = 0
			
			lost.emit()

func _process(_delta: float) -> void:
	var x = 0
	for i in range(1,goldInterestMax+1):
		if gold >= i * 5:
			x = x + 1
	goldInterest = x
func _ready() -> void:
	Global.goalStats = self


func _on_lost() -> void:
	for item in Global.inventory.inv:
		Global.inventory.inv[item]["Count"] = 0 
		Global.inventory.inv[item]["Have"] = false
		print(Global.inventory.inv[item])
