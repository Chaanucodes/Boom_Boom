extends RigidBody3D

#How much vertical force to apply
@export_range(750.0, 3000.0) var thurst : float = 1000.0;
@export_range(1,5) var level : int = 1;

@export var torqueThurst : float = 200.0


var isTransitioning : bool = false
var currentDelta : float

@onready var explosion_audio: AudioStreamPlayer = $ExplosionSound
@onready var success_sound: AudioStreamPlayer = $SuccessSound
@onready var rocket_audio: AudioStreamPlayer3D = $RocketAudio
@onready var booster_particles: GPUParticles3D = $BoosterParticles
@onready var booster_particles_right: GPUParticles3D = $BoosterParticlesRight
@onready var booster_particles_left: GPUParticles3D = $BoosterParticlesLeft
@onready var explosion_particles: GPUParticles3D = $ExplosionParticles
@onready var success_particles: GPUParticles3D = $SuccessParticles

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	currentDelta = delta
	if Input.is_action_pressed("boost"):
		boost()
	else:
		stopBoosting()
		
	if Input.is_action_pressed("ui_cancel"):
		get_tree().quit()

	if Input.is_action_pressed("rotate_left"):
		rotateLeft()
		
	else : stopRotateLeft()
		
	if Input.is_action_pressed("rotate_right"):
		rotateRight()

	else : stopRotateRight()
	

func _on_body_entered(body: Node) -> void:
	if isTransitioning == false:
		if "Goal" in body.get_groups():
			complete_level(body.file_path)
		
		if "Ground" in body.get_groups():
			crash_sequence()
		

func crash_sequence() -> void:
	print("Oh no")
	explosion_particles.emitting = true
	explosion_audio.play()
	set_process(false)
	isTransitioning = true
	var tween = create_tween()
	tween.tween_interval(2.5)
	tween.tween_callback(get_tree().reload_current_scene)
	

func complete_level(next_level_file: String) -> void:
	print("Oh yeah")
	success_particles.emitting = true
	success_sound.play()
	set_process(false)
	isTransitioning = true
	var tween = create_tween()
	tween.tween_interval(1.5)
	tween.tween_callback(get_tree().change_scene_to_file.bind(next_level_file))
	

func boost() -> void:
	apply_central_force(basis.y * currentDelta* thurst)
	booster_particles.emitting = true
	if rocket_audio.playing == false:
		rocket_audio.play()
		
func stopBoosting() -> void:
	rocket_audio.stop()
	booster_particles.emitting = false
	
func rotateRight() -> void:
	apply_torque(Vector3(0.0, 0.0, currentDelta *-torqueThurst))
	booster_particles_left.emitting = true

func rotateLeft() -> void:
	apply_torque(Vector3(0.0, 0.0, currentDelta *torqueThurst))
	booster_particles_right.emitting = true

func stopRotateRight() -> void:
	booster_particles_left.emitting = false
	
func stopRotateLeft() -> void:
	booster_particles_right.emitting = false
	


