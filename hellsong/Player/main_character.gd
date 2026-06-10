extends CharacterBody2D

@onready var player_sprite: AnimatedSprite2D = $PlayerSprite
@onready var bullet = preload("res://Scenes/bullet.tscn")
@onready var direction_x = 0
@onready var direction_y = 0
const SPEED = 50



func _ready() -> void:
	player_sprite.play("idle")

func _input(event: InputEvent) -> void:
	if event.is_action_pressed("con"):
		var obj = bullet.instantiate()
		obj.position = position
		if direction_x == 0 and direction_y == 0:
			obj.direction = Vector2(0,1)
		else:
			obj.direction = Vector2(direction_x,direction_y)
		add_sibling(obj)
		

func _physics_process(delta: float) -> void:
	direction_x = Input.get_axis("mvm_left", "mvm_right")
	direction_y = Input.get_axis("mvm_up", "mvm_down")
	if direction_x:
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
	if direction_y:
		velocity.y = direction_y * SPEED 
	else:
		velocity.y = move_toward(velocity.y, 0, SPEED)
	
	move_and_slide()
