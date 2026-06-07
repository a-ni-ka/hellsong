extends CharacterBody2D

@onready var player_sprite: AnimatedSprite2D = $PlayerSprite

const SPEED = 150.0


func _ready() -> void:
	player_sprite.play("idle")


func _physics_process(delta: float) -> void:
	var direction_x := Input.get_axis("mvm_left", "mvm_right")
	var direction_y := Input.get_axis("mvm_up", "mvm_down")
	
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction_y:
		velocity.y = direction_y * SPEED
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()
