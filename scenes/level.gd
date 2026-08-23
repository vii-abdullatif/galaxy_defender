extends Node2D

var meteor_scene : PackedScene = load("res://scenes/meteor.tscn")
var laser_scene : PackedScene = load("res://scenes/laser_1.tscn")

func _ready() -> void:
	var size := get_viewport().get_visible_rect().size
	var rng := RandomNumberGenerator.new()
	for star in $Stars.get_children():
		var random_x = rng.randf_range(0.0, size.x)
		var random_y = rng.randf_range(0.0, size.y)
		star.position = Vector2(random_x, random_y)
		var random_scale = rng.randf_range(0.5, 1.5)
		star.scale = Vector2(random_scale, random_scale)
		star.speed_scale = rng.randf_range(0.4, 1.5)

func _on_meteor_timer_timeout() -> void:
	var meteor := meteor_scene.instantiate()
	$Meteors.add_child(meteor)

func _on_player_laser(pos) -> void:
	var laser := laser_scene.instantiate()
	$Lasers.add_child(laser)
	laser.position = pos
