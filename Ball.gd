extends KinematicBody2D
export(int) var speed = 0;
export var direction = Vector2(-1, 1)
func _process(delta):
	move_and_slide(direction*speed, Vector2(0, -1))
	if(is_on_ceiling() || is_on_floor()):
		direction.y = -direction.y
	if(is_on_wall()):
		direction.x = -direction.x
	
