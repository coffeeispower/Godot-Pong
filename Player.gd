extends KinematicBody2D
export(int) var speed = 0;

func _process(delta):
	if(Input.is_action_pressed("pad_up")):
		move_and_slide(Vector2(0, -speed))
	if(Input.is_action_pressed("pad_down")):
		move_and_slide(Vector2(0, speed))
	pass
