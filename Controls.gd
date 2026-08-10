extends Control

var joystick_radius: float = 65.0
var touch_id: int = -1

@onready var joystick_base = $UICanvas/JoystickBase
@onready var stick = $UICanvas/JoystickBase/Stick

func _ready():
	joystick_base.position = Vector2(40, get_viewport_rect().size.y - 180)

func _input(event):
	if event is InputEventScreenTouch:
		if event.pressed and touch_id == -1:
			if joystick_base.get_global_rect().has_point(event.position):
				touch_id = event.index
		elif not event.pressed and event.index == touch_id:
			touch_id = -1
			stick.position = Vector2.ZERO
			Input.action_press("move_forward", 0.0)
			Input.action_press("move_right", 0.0)
	
	if event is InputEventScreenDrag and event.index == touch_id:
		var center = joystick_base.size / 2.0
		var pos = event.position - joystick_base.global_position - center
		if pos.length() > joystick_radius:
			pos = pos.normalized() * joystick_radius
		stick.position = pos
		var input_dir = pos / joystick_radius
		Input.action_press("move_forward", -input_dir.y)
		Input.action_press("move_right", input_dir.x)
