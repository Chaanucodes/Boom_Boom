extends AnimatableBody3D

@export var destination : Vector3
@export var duration : float = 1.0

var from_rotation = rotation_degrees
var to_rotation = from_rotation + Vector3(0, 180, 0)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var tween = create_tween()
	tween.set_loops()
	tween.tween_property(self, "global_position", global_position + destination, duration)
	tween.tween_property(self, "global_position", global_position, duration)



	# Set up the Tween interpolation


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
