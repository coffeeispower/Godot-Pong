extends KinematicBody2D
export(int) var speed = 0;
export(bool) var ai = false;
# Used needed when ai is ON
export(NodePath) var ball_node
onready var ball = get_node(ball_node) 

func run_ai():
	if(ball.position.x > OS.window_size.x/2):
		if(ball.position.y-$CollisionShape2D.shape.extents.y/2 < position.y):
			move("up")
	
		if(ball.position.y+$CollisionShape2D.shape.extents.y/2 > position.y):
			move("down")
	
func _process(delta):
	if(ai):
		run_ai()
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
