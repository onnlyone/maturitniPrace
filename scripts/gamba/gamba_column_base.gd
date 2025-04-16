extends Control
class_name ColumnBase


@export var colnum = int()


var symbols = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15]
var random = RandomNumberGenerator.new()
var rolli = []



signal rolled()


func get_odds():
	var odds = get_parent().odds
	return(odds)


func roll():
	for i in range(3):
		rolli.append(symbols[random.rand_weighted(get_odds())])
	return(rolli)
	


func _on_gamba_main_roll() -> void:
	rolli = []
	roll()
	rolled.emit()
	
