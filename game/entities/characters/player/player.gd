class_name Player
extends CharacterBody2D


var movement_speed: float = 200.0


func _physics_process(_delta: float) -> void:
	var direction: Vector2 = Input.get_vector("move_left", "move_right", "move_up", "move_down")
	velocity = direction * movement_speed
	
	move_and_slide()
