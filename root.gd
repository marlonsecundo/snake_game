extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
const Snake = preload("res://snake.tscn");


var grid = {
	"cellSize": Vector2(0,0),
	"maxRows": 0,
	"maxColumns": 0,
}

# Called when the node enters the scene tree for the first time.
func _ready():


	var snake = Snake.instance();
	
	_initGrid(snake);

	snake.init(grid);
	
	self.add_child(snake);

	pass # Replace with function body.

func _initGrid(snake):
	var viewportSize = get_viewport_rect().size;
	
	grid.cellSize = snake.texture.get_size();
	grid.maxRows = viewportSize.y / grid.cellSize.y;
	grid.maxColumns = viewportSize.x / grid.cellSize.x; 
	

	
	print(grid)
	
	
	
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
