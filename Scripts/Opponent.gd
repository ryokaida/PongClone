extends KinematicBody2D


# Declare member variables here. Examples:
export var speed = 250
var ball

func _ready():
	# get ball node
	ball = get_parent().find_node("ball")
	

# move opponennt paddle depending on where ball is in relation to paddle
func _physics_process(delta):
	move_and_slide(Vector2(0, getOpponentDirection()) * speed)


func getOpponentDirection():
	# subtract y pos of paddle from y position of ball
	# absolute value result
	# done to see if ball is not at the same height as paddle (will return 0)
	if abs(ball.position.y - position.y) > 25:
			# if ball is above paddle, return 1
			# otherwise, return -1
			if ball.position.y > position.y:
				return 1
			else:
				return -1
	else:
		return 0
