extends Node2D

const Snake = preload("res://snake.tscn");
const Food = preload("res://food.tscn");
const Score = preload("res://score.tscn");

var grid = {
	"cellSize": Vector2(0,0),
	"maxRows": 0,
	"maxColumns": 0,
}

var snake = Snake.instance();
var food = Food.instance();
var score = Score.instance();

func _ready():
	
	_initGrid(snake);

	snake.init(grid);

	_initSignals();

	_handleFoodEaten();
	
	self.add_child(score);
	self.add_child(food);
	self.add_child(snake);

	pass

func _initSignals():
	food.connect("food_eaten", self, "_handleFoodEaten");


func _initGrid(snake_instance):
	var viewportSize = get_viewport_rect().size;
	
	grid.cellSize = snake_instance.get_node("sprite").texture.get_size();
	grid.maxRows = int(viewportSize.y / grid.cellSize.y);
	grid.maxColumns = int(viewportSize.x / grid.cellSize.x); 
	
	
func _handleFoodEaten():
	
	score.addPoint();

	food.position.x = randi() % grid.maxColumns * grid.cellSize.x + 32;
	food.position.y = randi() % grid.maxRows * grid.cellSize.y + 32;
	pass	
	
