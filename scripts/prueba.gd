extends Node

var paused := false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	Input.mouse_mode = Input.MOUSE_MODE_CONFINED

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action("pause") and not paused:
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
		paused = true
	if event.is_action("shoot") and paused:
		Input.mouse_mode = Input.MOUSE_MODE_CONFINED
		paused = false
		
		
