extends Control


@onready var script_a_node = get_node("../Player")  # Adjust the path accordingly
var touch_start_time: float = 0.0
var long_press_duration: float = 1.0 
var timer : Timer
	
#func boost() -> void:
#	print("Boost called")
#
#	script_a_node.boost()
#
#func stopBoosting() -> void:
#	print("Stop boosting called")
#	#timer.stop()
#	script_a_node.stopBoosting()
#
#func rotateRight() -> void:
#	script_a_node.rotateRight()
#
#func rotateLeft() -> void:
#	script_a_node.rotateLeft()
#
#func stopRotateRight() -> void:
#	script_a_node.stopRotateRight()
#
#func stopRotateLeft() -> void:
#	script_a_node.stopRotateLeft()
#
#
#func _on_fire_pressed() -> void:
#	pass
##	timer = Timer.new()
##	timer.autostart = true
##	timer.wait_time = 0.1
##	timer.one_shot = false
##	timer.timeout.connect(boost)
##	touch_start_time = Time.get_ticks_msec()/ 0.1
#
#func _on_left_button_pressed() -> void:
#	rotateLeft() 
#
#func _on_right_button_pressed() -> void:
#	rotateRight()
#
#func _on_fire_released() -> void:
#	_on_long_press()
#
#func _on_left_button_released() -> void:
#	stopRotateLeft()
#
#
#func _on_right_button_released() -> void:
#	stopRotateRight()
#
#
#func _on_gui_input(event: InputEvent) -> void:
#	pass
##	if event is InputEventScreenTouch:
##		var touch_event = event as InputEventScreenTouch
##		if touch_event.pressed:
##			timer = Timer.new()
##			timer.timeout.connect(_on_timer_timeout)
##			touch_start_time = Time.get_ticks_msec()/ 10.0
##		elif touch_event.is_pressed() == false:
##			var touch_duration = Time.get_ticks_msec() / 10.0 - touch_start_time
##			if touch_duration >= long_press_duration:
##				_on_long_press()
#
#
#func _on_long_press():
#	stopBoosting()
#	# Add your custom logic here
#
#
#func _on_timer_timeout() -> void:
#	boost() # Replace with function body.
