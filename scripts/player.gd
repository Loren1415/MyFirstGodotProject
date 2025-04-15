extends CharacterBody2D

@onready var player_shoot_sound = $PlayerShootSound

signal took_damage
var speed = 350
var rocket_scene = preload("res://scenes/rocket.tscn")
var rocket_container

func _ready():
	rocket_container = get_node("RocketContainer")

func _physics_process(_delta):
	if Input.is_action_pressed("Right"):
		velocity.x = speed
	if Input.is_action_pressed("Left"):
		velocity.x = -speed
	if Input.is_action_pressed("Up"):
		velocity.y = -speed
	if Input.is_action_pressed("Down"):
		velocity.y = speed
	move_and_slide()
	
	var screen_size = get_viewport_rect().size
	global_position = global_position.clamp(Vector2(0,0),screen_size)
	
func _process(_delta):
	if Input.is_action_just_pressed("shoot"):
		shoot()
		
		
func shoot():
	var rocket_instance = rocket_scene.instantiate()
	rocket_container.add_child(rocket_instance)
	rocket_instance.global_position = global_position
	rocket_instance.global_position.x += 75
	player_shoot_sound.play()
	
		
func take_damage():
		emit_signal("took_damage")
		
func die():
	queue_free()
