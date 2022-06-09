extends KinematicBody2D

export(NodePath) var player1LabelPath
onready var player1Label: Label = get_node(player1LabelPath); 
export(NodePath) var player2LabelPath
onready var player2Label: Label = get_node(player2LabelPath);
var scorePlayer1 = 0;
var scorePlayer2 = 0;
func update_score_labels():
	player1Label.text = String(scorePlayer1);
	player2Label.text = String(scorePlayer2);


export var direction = Vector2(-1, 1)
export(int) var speed = 0;
func move_ball():
	move_and_slide(direction*speed, Vector2(0, -1))


func bounce_ball_if_colliding():
	if(is_on_ceiling() || is_on_floor()):
		direction.y = -direction.y
	if(is_on_wall()):
		direction.x = -direction.x


func incrementScorePlayer1():
	scorePlayer1 += 1


func incrementScorePlayer2():
	scorePlayer2 += 1



func check_scored():
	var screen_width = OS.window_size.x
	if(position.x <= 0):
		reset_pos()
		incrementScorePlayer2()
		set_random_direction()
	if(position.x >= screen_width):
		reset_pos()
		incrementScorePlayer1()
		set_random_direction()



onready var startPos = position;
func reset_pos():
	position = startPos;

func set_random_direction():
	var result = Vector2()

	var x = randi()%2;
	if(x == 0):
		result.x = -1;
	if(x == 1):
		result.x = 1;
	
	var y = randi()%2;
	if(y == 0):
		result.y = -0.3;
	if(y == 1):
		result.y = 0.3;
	direction = result
	

func _process(_delta):
	move_ball()
	bounce_ball_if_colliding()
	check_scored()
	update_score_labels()
	pass
