extends KinematicBody2D
class_name Player

var _speed := 30
var _velocity := Vector2.ZERO
var _direction := Vector2.ZERO


func _ready():
	pass # Replace with function body.


func _process(delta):
	_move(delta)


func _move(delta: float) -> void:
	_velocity = Vector2(
			Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
			Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
		)
	_select_animation()
	_velocity = move_and_slide(_velocity * _speed * delta * 100)


func _select_animation() -> void:
	var anim: String
	if _velocity == Vector2.ZERO:
		match $AnimatedSprite.animation:
			"left":
				anim = "idle_left"
			"right":
				anim = "idle_right"
			"top":
				anim = "idle_top"
			"down":
				anim = "idle_down"
	else:
		if _velocity.x == -1:
			anim = "left"
		elif _velocity.x == 1:
			anim = "right"
		elif _velocity.y == -1:
			anim = "top"
		elif _velocity.y == 1:
			anim = "down"
	$AnimatedSprite.play(anim)
