extends Area2D

@onready var visible_notifier = $VisibleNotifier
@export var speed = 300

func _ready():
	visible_notifier.connect("screen_exited", _on_screen_exited)

func _physics_process(delta):
	global_position.x += speed*delta
	
func _on_screen_exited():
	queue_free()
	
func _on_area_entered(area):
	queue_free()
	area.die()
