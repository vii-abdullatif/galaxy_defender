extends CharacterBody2D

@export var speed := 500
@export var max_health := 100

var health := max_health
var collided := false

signal laser(pos)
signal current_health(health)
signal died

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed
	move_and_slide()
	if Input.is_action_just_pressed("shoot"):
		laser.emit($LaserStartPosition.global_position)

func take_damage(amount: int) -> void:
	health -= amount
	health = clamp(health, 0, max_health)
	if health > 0:
		current_health.emit(health)
	else:
		died.emit()

func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("meteors"):
		take_damage(10)
		print(health)
