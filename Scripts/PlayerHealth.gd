extends Health

@onready var healthbar = $Healthbar

func _ready():
	super._ready()
	healthbar.init_health(current)

func take_damage(amount : int):
	super.take_damage(amount)
	healthbar.health = current

func heal(amount : int):
	super.heal(amount)
	healthbar.health = current
