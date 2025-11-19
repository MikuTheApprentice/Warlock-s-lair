extends ProgressBar

@onready var health_text : Label = get_node("HealthText")
@onready var timer = $Timer
@onready var damage_bar = $DamageBar

var health = 0 : set = _set_health

#func _ready():
	#var health = get_parent().get_node("Health")
	#health.on_change_connect(on_health_change)
	#on_health_change(health.current, health.max)

#func on_health_change (current : int, max : int):
	#max_value = max
	#value = current
	#health_text.text = str(current) + " / " + str(max)

func _set_health(new_health):
	var prev_health = health
	health = min(max_value, new_health)
	value = health
	health_text.text = str(health)# + " / " + str(max_value)
	
	if health <= 0:
		queue_free()
	
	if health < prev_health:
		timer.start()
	else:
		damage_bar.value = health

func init_health(_health):
	health = _health
	max_value = health
	value = health
	damage_bar.max_value = health
	damage_bar.value = health


func _on_timer_timeout():
	damage_bar.value = health
