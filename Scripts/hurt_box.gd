extends Area2D

@export_enum("Cooldown", "HitOnce", "DisableHitBox") var HurtBoxType = 0

@onready var collision = $CollisionShape2D
@onready var disableTimer = $DisableTimer

signal hurt(damage)


func _on_area_entered(area):
	if area.is_in_group("attack"):
		if not area.get("damage") == null:
			match HurtBoxType:
				0: # Cooldown
					collision.call_deferred("set", "disable", true)
					disableTimer.start()
				1: # HitOnce
					pass
				2: # Disable HitBox
					if area.has_method("tempDisable"):
						area.tempDisable()
			var damage = area.damage
			emit_signal("hurt", damage) 

func _on_disable_timer_timeout():
	collision.call_deferred("set", "disable", false)

