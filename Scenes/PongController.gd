extends Node


# Declare member variables here. Examples:
export var maxScore = 10
var p1Score = 0
var p2Score = 0
var ball

	
# retreive ball object
func _ready():
	ball = find_node("ball")
	
	# set winLabel text to not visible
	$winLabel.visible = false
	
# increment p2 score and reset ball
func _on_Player2Goal_body_entered(body):
	scored("p2")


# increment p1 score and reset ball
func _on_Player1Goal_body_entered(body):
	scored("p1")


func _process(delta):
	# display scores on screen
	$PlayerScore.text = str(p1Score)
	$OpponentScore.text = str(p2Score)
	
	# display timer on screen
	$CountdownTimerLabel.text = str(int($CountdownTimer.time_left) + 1)
	
	# check to see if a player has won
	if (p1Score == 10) or (p2Score == 10):
		# reset and stop ball
		$ball.position = Vector2(512, 300)
		ball.stopBall()
		
		# determine which player won
		if p1Score == 10:
			$winLabel.text = "Player 1 wins!"
		else:
			$winLabel.text = "Player 2 wins!"
		
		# display win text
		$winLabel.visible = true


# wait 2 seconds before releasing ball
func _on_CountdownTimer_timeout():
	ball.restartBall()
	$CountdownTimerLabel.visible = false


# increment score and reset ball to center of screen
# also start timer for 2 seconds
func scored(player):
	# reset only ball to center of screen
	$ball.position = Vector2(512, 300)
	if player == "p1":
		p1Score += 1
	else:
		p2Score += 1
	ball.stopBall()
	$CountdownTimer.start()
	$CountdownTimerLabel.visible = true
	$Player1Paddle.position.x = 40
	$Player2Paddle.position.x = 969
