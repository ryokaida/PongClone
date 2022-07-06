extends KinematicBody2D

# set member variables
export var speed = 600 # set speed of ball, and make editable outside of code
var velocity = Vector2.ZERO # set velocity to empty Vector2


func _ready():
	# randomize where the ball goes at start
	randomize() # pick random seed to pick subsequent numbers from
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]
	

func _physics_process(delta):
	# move ball until it collides with object and get object that ball collided with
	var collisionObject = move_and_collide(velocity * speed * delta)
	
	# if object was collided into then bounce ball off of object
	if collisionObject:
		velocity = velocity.bounce(collisionObject.normal) # normal = direction that collided on surface is facing

# stop ball from moving
func stopBall():
	speed = 0

func restartBall():
	speed = 600
	velocity.x = [-1,1][randi() % 2]
	velocity.y = [-0.8,0.8][randi() % 2]
