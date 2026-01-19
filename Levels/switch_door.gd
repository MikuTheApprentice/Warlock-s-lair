extends Area3D

var player_close = false
var door_open = false

func _on_body_entered(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_close = true
		Global.interactable = true

func _process(delta):
	if player_close and not door_open:
		if Input.is_action_just_pressed("interact"):
			get_node("AnimationPlayer").play("door_open")
			door_open = true
			await get_tree().create_timer(10.0).timeout
	if player_close and door_open:
		if Input.is_action_just_pressed("interact"):
			get_node("AnimationPlayer").play("door_close2")
			door_open = false
			await get_tree().create_timer(10.0).timeout

func _on_body_exited(body: Node3D) -> void:
	if body.is_in_group("Player"):
		player_close = false
		Global.interactable = false
