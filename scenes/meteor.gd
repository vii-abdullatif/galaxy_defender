extends Area2D

var speed : int
var rotation_speed : int
var direction_x : float

func _ready() -> void:
	var rng := RandomNumberGenerator.new()
	var width = get_viewport().get_visible_rect().size[0]
	var random_x = rng.randi_range(0, width)
	var random_y = rng.randi_range(-150, -50)
	var path : String = "res://assets/kenney_space-shooter-remastered/PNG/Meteors/meteorBrown_big" + str(randi_range(1, 4)) + ".png"
	$MeteorImage.texture = load(path)
	position += Vector2(random_x, random_y)
	speed = rng.randi_range(400, 600)
	rotation_speed = rng.randi_range(20, 100)
	direction_x = rng.randf_range(-1, 1)

func _process(delta: float) -> void:
	position += Vector2(direction_x, 1.0) * speed * delta
	rotation_degrees += rotation_speed * delta

func _on_body_entered(body: Node2D) -> void:
	print(body)
