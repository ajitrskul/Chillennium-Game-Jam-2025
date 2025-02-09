extends Node2D



var inputCache = [0, 0, 0] 

var rightAnswer = [3, 1, 2]

func puzzle(switchName: String) -> void:
	print(switchName)
	for i in range(3):
		if inputCache[i] == 0:
			if switchName == "Switch":
				inputCache[i] = 1
			elif switchName == "Switch2":
				inputCache[i] = 2
			elif switchName == "Switch3":
				inputCache[i] = 3
			if i == 2:
				checkPuzzle()
			break

func checkPuzzle() -> void:
	for i in range(3):
		if inputCache[i] != rightAnswer[i]:
			inputCache = [0, 0, 0]
			$Switch.switchVal = false
			$Switch2.switchVal = false
			$Switch3.switchVal = false
			return
	$MoveableWall.open()
