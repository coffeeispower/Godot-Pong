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


onready var screen_width = OS.window_size.x
func check_scored():
	if(position.x <= 0):
		reset_pos()
		incrementScorePlayer2()
	if(position.x >= screen_width):
		reset_pos()
		incrementScorePlayer1()



onready var startPos = position;
func reset_pos():
	position = startPos;


func _process(delta):
	move_ball()
	bounce_ball_if_colliding()
	check_scored()
	update_score_labels()
	pass
