extends Area2D

signal food_eaten;

func _ready():
	pass 

func _on_food_area_shape_entered(area_id, area, area_shape, self_shape):
	emit_signal("food_eaten")
	pass 
