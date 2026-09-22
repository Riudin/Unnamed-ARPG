class_name GameContext
extends Node2D


signal main_menu_requested

@export var _player_scene: PackedScene

var _game_state: GameState
var _player: Player

@onready var main_menu_button: Button = %MainMenu


func build() -> void:
	# Build any services or other variables that we need in this context.
	_game_state = GameState.new()
	
	# Build Player
	if not _player:
		print("no player found")
		var new_player: Player = _player_scene.instantiate()
		new_player.global_position = _game_state.player_position
		add_child(new_player)
		_player = new_player


func bind_dependencies() -> void:
	# Pass in and bind any dependencies that this context needs form parent.
	pass


func setup() -> void:
	# At this point we have ALL dependencies resolved and we can do any
	# setup that requires these, e.g. connect signals and use factories, etc.
	main_menu_button.pressed.connect(main_menu_requested.emit)
