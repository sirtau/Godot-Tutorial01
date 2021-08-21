extends Area2D

export var speed = 100;
export var moveDist = 100;

onready var startX = position.x
onready var targetX = position.x + moveDist

func _physics_process(delta):

	position.x = move_to(position.x, targetX, speed * delta)
	
	if position.x == targetX:
		if targetX == startX:
			targetX = position.x  + moveDist
		else:
			targetX = startX

func move_to (current, to, step):
	
	var new = current
	
	if new < to:
		new += step
		
		if new > to:
			new = to
	else:
		new -= step
		
		if new < to:
			new = to
			
	return new

func _on_Enemy_body_entered(body):
	
	if body.name == "Player": 
		body.die()
