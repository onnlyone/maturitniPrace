extends Control


@onready var shopItem0 = $shopItem0
@onready var shopItem1 = $shopItem1
@onready var shopItem2 = $shopItem2
@onready var shopItem0button = $shopItem0/Button
@onready var shopItem1button = $shopItem1/Button
@onready var shopItem2button = $shopItem2/Button
@onready var Gold = $Gold


func addItem(itemi):
	Global.inventory.inv[itemi]["Have"] = true
	Global.inventory.inv[itemi]["Count"] += 1
	print("itemi: ",itemi,", count: ",Global.inventory.inv[itemi]["Count"])



func _on_buy_pressed() -> void:
	var items = [
			{"item": shopItem0, "button": shopItem0button},
			{"item": shopItem1, "button": shopItem1button},
			{"item": shopItem2, "button": shopItem2button}
		]
	for pair in items:
		var item = pair["item"]
		var button = pair["button"]
		if item.selected:
			var item_data = itemDic.items[item.itemi]
			var price = item_data["Price"]
			if Global.goalStats.gold >= price:
				Global.goalStats.gold -= price
				addItem(item.itemi)
				item.visible = false
				button.button_pressed = false
			else:
				print("Not enough money for:", item_data["Name"])




func _on_close_pressed() -> void:
	Global.game_controller.current_3d_scene.visible = true
	Global.game_controller.current_gui_scene.visible = false

func _process(delta: float) -> void:
	Gold.text = str(Global.goalStats.gold)


func _on_shop_item_0_rerolled() -> void:
	Global.goalStats.gold += 20
