extends KinematicBody2D


# Declare member variables here. Examples:
export var speed = 400


func _physics_process(delta):
	var velocity = Vector2.ZERO # set velocity to empty Vector 2
	
	# if p1 presses "w", then move p1 paddle up
	# paddle will not go above top of screen edge
	if (Input.is_action_pressed("ui_up")):
		velocity.y -= 1
	
	# if p1 presses "s", then move p1 paddle down
	# paddle will not go below bottom of screen edge
	if (Input.is_action_pressed("ui_down")):
		velocity.y += 1
		
	
	# move the paddle
	move_and_slide(velocity * speed)
