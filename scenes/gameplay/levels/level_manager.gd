extends Node2D

const ENEMY_FOLLOWING_H_OFFSET = 15
const ENEMY_FOLLOWING_V_OFFSET = 50


var enemy_scene = preload("res://scenes/enemy/enemy.tscn")


func _on_CallEnemiesButton_pressed():
	$WaveManager.start_next_wave()
	$CallEnemiesButton.disabled = true


func _on_WaveManager_spawn_enemy(enemy_type, enemy_grade):
	var enemy = enemy_scene.instance()
	enemy.initialise(enemy_type, enemy_grade)
	var path_foll = PathFollow2D.new()
	path_foll.loop = false
	path_foll.position = $SpawnPoint.position
	path_foll.h_offset = rand_range(0.0, ENEMY_FOLLOWING_H_OFFSET)
	path_foll.v_offset = rand_range(0.0, ENEMY_FOLLOWING_V_OFFSET)
	path_foll.add_child(enemy)
	$Path2D.add_child(path_foll)


func _on_WaveManager_last_enemy_in_actual_wave_spawned():
	$CallEnemiesButton.disabled = false


func _on_WaveManager_last_enemy_spawned():
	$CallEnemiesButton.disabled = true


func _on_WaveManager_last_wave():
	pass # Replace with function body.



