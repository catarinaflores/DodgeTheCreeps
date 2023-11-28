extends RigidBody2D



func _on_body_entered(body: Node) -> void:
	get_tree().call_group("mob", "queue_free")
	queue_free()
