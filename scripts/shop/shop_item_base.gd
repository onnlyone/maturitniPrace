extends Area2D
class_name  Hoverable


@onready var anim = $Anim
@onready var button = $Button
var itemlist = [0,1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16]
var odds = [100,90,80,70,60,50,40,30,20,1,0,0,0,0,0,0,10]
var random = RandomNumberGenerator.new()
var itemi = 0
var selected = false

signal rerolled


func rollItem():
	itemi = itemlist[random.rand_weighted(odds)]
	#print(itemi)
	anim.set_frame_and_progress(itemi,0)


func _ready() -> void:
	visible = true
	rollItem()



func _on_reroll_pressed() -> void:
	if Global.goalStats.gold >= 10:
		rerolled.emit()
		Global.goalStats.gold = Global.goalStats.gold - 10
		visible = true
		rollItem()



func _on_button_toggled(toggled_on: bool) -> void:
	if toggled_on:
		button.text = "$"
		selected = true
		#print("on")
	else:
		button.text = ""
		selected = false
		#print("off")
