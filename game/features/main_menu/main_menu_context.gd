class_name MainMenuContext
extends Node2D


signal start_game_requested
signal options_menu_requested
signal quit_game_requested

@onready var start_game_button: Button = %StartGame
@onready var options_button: Button = %Options
@onready var quit_button: Button = %Quit


func build() -> void:
	# Build any services or other variables that we need in this context.
	pass


func bind_dependencies() -> void:
	# Pass in and bind any dependencies that this context needs form parent.
	pass


func setup() -> void:
	# At this point we have ALL dependencies resolved and we can do any
	# setup that requires these, e.g. connect signals and use factories, etc.
	start_game_button.pressed.connect(start_game_requested.emit)
	options_button.pressed.connect(options_menu_requested.emit)
	quit_button.pressed.connect(quit_game_requested.emit)
