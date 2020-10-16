extends Sprite

var delay = 0.3
var time = 0;

var edgesPosition = {
	"left": 0,
	"top": 0,
	"right": 0,
	"bottom": 0
};

var screenEdges = {
	"LEFT" : 0,
	"TOP" : 0,
	"RIGHT": 0,
	"BOTTOM": 0,
};


var textureSize = self.texture.get_size() / 2;
var gameGrid;
var nextPosition = Vector2.ZERO;

func init(grid):
	gameGrid = grid;

func _ready():
	screenEdges = {
		"LEFT" : 0,
		"TOP" : 0,
		"RIGHT": get_viewport().size.x,
		"BOTTOM": get_viewport().size.y
	};
	
	position.x = screenEdges.LEFT + textureSize.x;
	position.y = screenEdges.TOP + textureSize.y;

func _process(delta):
	
	time += delta;
	
	if (Input.is_action_pressed("ui_left")):
		nextPosition = Vector2.LEFT;
	elif (Input.is_action_pressed("ui_right")):
		nextPosition = Vector2.RIGHT;
	elif (Input.is_action_pressed("ui_up")):
		nextPosition = Vector2.UP;
	elif (Input.is_action_pressed("ui_down")):
		nextPosition = Vector2.DOWN;
		
		
	if (time > delay):
		addPosition(nextPosition);
		time = 0;

		
	_handlePosition();
	
	
func _handlePosition():
	
	edgesPosition.left = position.x - textureSize.x;
	edgesPosition.right = position.x + textureSize.x;
	edgesPosition.top = position.y - textureSize.y;
	edgesPosition.bottom = position.y + textureSize.y;
	
	

	
	if (edgesPosition.left < screenEdges.LEFT):
		setPositionX(gameGrid.maxColumns - 1);
	elif (edgesPosition.right > screenEdges.RIGHT):
		setPositionX(0);
	elif (edgesPosition.top < screenEdges.TOP):
		setPositionY(gameGrid.maxRows - 1);
	elif (edgesPosition.bottom > screenEdges.BOTTOM):
		setPositionY(0);
		
func addPosition(gridPosition):
	
	position.x += gameGrid.cellSize.x * gridPosition.x;
	position.y += gameGrid.cellSize.y * gridPosition.y;
	
	pass

func setPositionX(x):
	position.x = gameGrid.cellSize.x * x + textureSize.x;
	pass
	
func setPositionY(y):
	position.y = gameGrid.cellSize.y * y + textureSize.y;
	
	
	
