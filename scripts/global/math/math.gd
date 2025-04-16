extends Node


func sum_array(arr: Array) -> float:
	var total := 0.0
	for value in arr:
		total += value
	return(total)
