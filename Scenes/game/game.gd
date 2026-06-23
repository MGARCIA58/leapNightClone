extends Node2D
class_name Game

@onready var player: Player = $Player
@onready var spawn_pos: Marker2D = $SpawnPos
@onready var checkpoint_respawn_pos: Marker2D = $checkpointRespawnPos

var points: int
var checkpoint_reached: bool

func _ready() -> void:
	EventManager.on_player_dead.connect(_on_player_dead)
	EventManager.on_fruit_collected.connect(_on_fruit_collected)
	EventManager.on_checkpoint_reached.connect(_on_checkpoint_reached)
	
func get_respawn_pos() -> Vector2:
	if checkpoint_reached:
		return checkpoint_respawn_pos.position
	else:
		return spawn_pos.position
	
func _on_player_dead() -> void:
	player.player_dead()
	await get_tree().create_timer(0.5).timeout
	var tween := create_tween()
	tween.tween_property(player, "global_position", get_respawn_pos(), 0.5)
	tween.tween_callback(player.player_respawn)
	

func _on_fruit_collected() -> void:
	points += 1
	print(points)

func _on_checkpoint_reached() -> void:
	checkpoint_reached = true
	
