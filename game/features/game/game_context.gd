class_name GameContext
extends Node2D


signal main_menu_requested

@onready var main_menu_button: Button = %MainMenu


func build() -> void:
	# Build any services or other variables that we need in this context.
	pass


func bind_dependencies() -> void:
	# Pass in and bind any dependencies that this context needs form parent.
	pass


func setup() -> void:
	# At this point we have ALL dependencies resolved and we can do any
	# setup that requires these, e.g. connect signals and use factories, etc.
	main_menu_button.pressed.connect(main_menu_requested.emit)
