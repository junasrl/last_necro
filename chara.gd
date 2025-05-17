extends CharacterBody2D
enum playerState {
	WALK,
	ACTION,
	DASH,
	IDLING
}

const SPEED = 300
const JUMP_VELOCITY = -400.0
@onready var animated_sprite_2d: AnimatedSprite2D = $AnimatedSprite2D

func _physics_process(delta: float) -> void:
	var direction := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * SPEED
		
	if velocity != Vector2(0,0):
		animated_sprite_2d.play("run")
	else:
		animated_sprite_2d.play("idle")
	
	if velocity.x > 1:
		animated_sprite_2d.flip_h = false
		
	elif velocity.x < 1:
		animated_sprite_2d.flip_h = true

	move_and_slide()
