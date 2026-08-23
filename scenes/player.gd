extends CharacterBody2D

@export var speed := 500

signal laser(pos)

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


func _on_area_2d_area_entered(area: Area2D) -> void:
	if area.is_in_group("meteors"):
		LiveCounter.lives -= 1
