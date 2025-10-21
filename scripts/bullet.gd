extends Area2D

var direction := Vector2.RIGHT
var speed := 200.0
# Called when the node enters the scene tree for the first time.
var velocity

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position += delta* direction * speed

func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("enemies"):
		body.hit()


func _on_visible_on_screen_notifier_2d_screen_exited() -> void:
	queue_free()
