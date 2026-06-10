extends StaticBody2D

var direction = Vector2(0,0)
const SPEED = 300



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	var motion = delta * direction * SPEED
	move_and_collide(motion)
