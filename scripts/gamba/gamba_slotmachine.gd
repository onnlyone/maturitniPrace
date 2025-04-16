extends Control


var odds = [65,60,55,50,45,40,20,10,5,1,0,0,0,0,0,0]
var basevalues = [1,2,3,4,5,10,20,50,100,1000]
var score = 0.0
var basescore = 0.0
var rollnum = 0



signal rolled



func is_win(wini):
	if wini != []:
		print("win: true")
		return(true)
	else:
		print("win: false")
		return(false)

func get_wini(rollgrid):
	var wini = []
	for i in rollgrid[0]:
		if i in rollgrid[1] and i in rollgrid[2] and i not in wini:
			wini.append(i)
	return(wini)

func get_paylinecount(wini,rollgrid):
	var paylinecount = []
	for i in wini:
		paylinecount.append(1 * rollgrid[0].count(i) * rollgrid[1].count(i) * rollgrid[2].count(i))
	return(paylinecount)



func basescorecalc(paylinecount,wini):
	basescore = 0.0
	var scorepm = 0.0
	var x = 0
	for i in wini:
		scorepm = scorepm + (paylinecount[x] * basevalues[i] * (1 + Global.inventory.inv[i]["Count"]) * (1 + Global.inventory.inv[16]["Count"]))
		print("multtype: ",itemDic.items[i]["Name"])
		x = x+1
	basescore = scorepm
	return(scorepm)



func _on_gamba_grid_griddone(rollgrid) -> void:
	var wini = get_wini(rollgrid)
	var win = is_win(wini)
	var paylinecount = Array()
	var scorePM := 0.0
	rollnum = rollnum + 1
	rolled.emit()
	if win:
		print("wini: ",wini)
		paylinecount = get_paylinecount(wini,rollgrid)
		print("payline_count: ",paylinecount)
		print("payline_total: ",int(math.sum_array(paylinecount)))
		print("basescore: ",basescorecalc(paylinecount,wini))
		score = score + basescore
		scorePM = basescorecalc(paylinecount,wini)
		print("score: ",score)
		pass

	


func _on_goal_stats_lost() -> void:
	basescore = 0
	rollnum = 0
	score = 0
