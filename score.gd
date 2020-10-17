extends Node2D


var _score = -1;

func _ready():
	
	pass


func addPoint():
	_score += 1;
	$label.text = str(_score);

