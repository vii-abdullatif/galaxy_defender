extends Node2D

func _ready() -> void:
	LiveCounter.lives = 3

func _physics_process(_delta: float) -> void:
	if LiveCounter.lives == 2:
		$Life3.hide()
	if LiveCounter.lives == 1:
		$Life2.hide()
	if LiveCounter.lives == 0:
		get_tree().change_scene_to_file("res://scenes/UI/game_over.tscn")
