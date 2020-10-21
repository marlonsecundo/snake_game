extends Area2D

signal snake_collided(area_name);


var Tail = load("res://tail.tscn");

var tail;
var prevPosition;
	
func addTail(t):
	if (tail == null):
		tail = t;
		tail.setPosition(prevPosition);
	else:
		tail.addTail(t);
		
func removeTail():
	if (tail != null):
		tail.removeTail();
		tail = null;
		
	get_parent().remove_child(self);
		
		
func setPosition(pos):
		
	prevPosition = position;
	position = pos;
	
	if (tail != null):
		tail.setPosition(prevPosition);
		
	


func _ready():
	
	pass



func _on_Area2D_area_shape_entered(area_id, area, area_shape, self_shape):



	emit_signal("snake_collided", area.get_name());
	pass
