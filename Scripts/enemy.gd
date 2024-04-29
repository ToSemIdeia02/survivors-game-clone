extends CharacterBody2D

@export var speed = 20.0
@export var hp = 10.0
@onready var player = get_tree().get_first_node_in_group("player")
@onready var animation = $animation_giant_fly

func _ready():
	animation.play("idle")

func _physics_process(_delta):
	var direction = global_position.direction_to(player.global_position)
	velocity = direction * speed
	move_and_slide()
	
	if direction.x > 0.1:
		animation.play("idle")
	elif direction.x < -0.1:
		animation.play("flip")
		


func _on_hurt_box_hurt(damage):
	hp -= damage
	if hp <= 0:
		queue_free()
