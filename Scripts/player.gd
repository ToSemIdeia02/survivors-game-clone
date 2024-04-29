extends CharacterBody2D

var speed = 80.0
var hp = 80.0
@onready var animation = $animation_player


func _physics_process(_delta):
	movement()
	
func movement():
	var x_mov = Input.get_action_strength("right") - Input.get_action_strength("left")
	var y_mov = Input.get_action_strength("down") - Input.get_action_strength("up")
	var mov = Vector2(x_mov, y_mov) # movement direction
	
	
	if mov != Vector2.ZERO:
		if mov.x < 0:
			animation.play("left")  # Or "idle_side" (right side)
		elif mov.x > 0:
			animation.play("right")
		elif mov.y < 0:
			animation.play("back")
		elif mov.y > 0:
			animation.play("front")
	
	
	
	velocity = mov.normalized() * speed
	move_and_slide()


func _on_hurt_box_hurt(damage):
	hp -= damage
	print(hp)
