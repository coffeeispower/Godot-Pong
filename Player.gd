extends KinematicBody2D
export(int) var speed = 0;
export(bool) var ai = false;
# Used needed when ai is ON
export(NodePath) var ball_node
onready var ball = get_node(ball_node) 
func _process(delta):
	if(ai):
		if(ball.position.y-$CollisionShape2D.shape.extents.y < position.y):
			move("up")
		else:
			if(ball.position.y + $CollisionShape2D.shape.extents.y > position.y):
				move("down")
	else:
		handle_input()
func move(dir: String):
	if(dir == "up"):
		move_and_slide(Vector2(0, -speed))
	if(dir == "down"):
		move_and_slide(Vector2(0, speed))
func handle_input():
	if(Input.is_action_pressed("pad_up")):
		move("up")
	if(Input.is_action_pressed("pad_down")):
		move("down")
