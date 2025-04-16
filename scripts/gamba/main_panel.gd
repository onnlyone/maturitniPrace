extends Panel

@onready var goalStats = $"../goalStats"
@onready var turn = $RollNum
@onready var goal = $Goal
@onready var gold = $Gold
@onready var goalCount = $GoalCount
@onready var gameOverScreen = $GameOverScreen
@onready var gameOverScreenLable = $GameOverScreen/Lable
@onready var highScore = $HighScore

func _ready() -> void:
	gameOverScreenLable.text = "Press SPACE to invest"
	gameOverScreen.visible = true


func _process(_delta: float) -> void:
	turn.text = str("Rolls this run: ",get_node("../gambaSlotmachine").rollnum)
	goal.text = str("Goal (in ",goalStats.goalRolls," rolls): ",goalStats.goalScore,)
	gold.text = str("Gold: ",goalStats.gold,"\nGold per turn: ",goalStats.goldPT," + ",goalStats.goldInterest," Interest (max ",goalStats.goldInterestMax,")")
	goalCount.text = str("Goals cleared: ",goalStats.goalCount)
	highScore.text = str("Highscore: ",goalStats.highScore)


func _on_gamba_slotmachine_rolled() -> void:
	if gameOverScreen.visible == true:
		gameOverScreen.visible = false


func _on_goal_stats_lost() -> void:
	gameOverScreenLable.text = "Game Over\nPress SPACE to invest again"
	gameOverScreen.visible = true
