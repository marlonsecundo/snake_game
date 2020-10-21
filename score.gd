extends Node2D


var _score = 0;
var _bestScore = 0;

func _ready():
	
	pass


func addPoint():
	_score += 1;
	$label.text = str(_score);
	

func resetScore():
	
	if (_score > _bestScore):
		_bestScore = _score;
		$bestScore.text = "Melhor Pontuação: " + str(_bestScore);
	
	$prevScoreLabel.text = "Pontuação Anterior: " + str(_score);	
	_score = 0;
	$label.text = str(_score);
