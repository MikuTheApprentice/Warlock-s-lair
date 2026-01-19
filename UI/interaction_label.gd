extends Node2D

@onready var label = $Label

func _process(delta: float) -> void:
	if Global.interactable:
		label.show()
	if not Global.interactable:
		label.hide()
