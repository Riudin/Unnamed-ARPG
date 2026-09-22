class_name RootContext
extends Node2D
## This is the Root Context of the game. Builds services, injects dependencies
## and sets up anything else that needs setting up in the game. Also handles sub-contexts.


@export var main_menu_context_scene: PackedScene
@export var options_menu_context_scene: PackedScene
@export var game_context_scene: PackedScene

var _current_context: Node


func _ready() -> void:
	build()
	bind_dependencies()
	setup()


func build() -> void:
	# Build any services or other variables that we need in this context.
	pass


func bind_dependencies() -> void:
	# Pass in and bind any dependencies that this context needs form parent.
	pass


func setup() -> void:
	# At this point we have ALL dependencies resolved and we can do any
	# setup that requires these, e.g. connect signals and use factories, etc.
	mount_game()
	#mount_main_menu()


func mount_main_menu() -> void:
	if _current_context:
		_current_context.queue_free()
	
	_current_context = main_menu_context_scene.instantiate()
	var context: MainMenuContext = _current_context as MainMenuContext
	if not context:
		printerr("No menu context found")
		return
	
	add_child(context)
	context.build()
	context.bind_dependencies()
	context.setup()
	
	context.start_game_requested.connect(mount_game)
	context.options_menu_requested.connect(mount_options_menu)
	context.quit_game_requested.connect(get_tree().quit)


func mount_options_menu() -> void:
	if _current_context:
		_current_context.queue_free()
	
	_current_context = options_menu_context_scene.instantiate()
	var context: OptionsMenuContext = _current_context as OptionsMenuContext
	if not context:
		printerr("No options menu context found")
		return
	
	add_child(context)
	context.build()
	context.bind_dependencies()
	context.setup()
	
	context.main_menu_requested.connect(mount_main_menu)


func mount_game() -> void:
	if _current_context:
		_current_context.queue_free()
	
	_current_context = game_context_scene.instantiate()
	var context: GameContext = _current_context as GameContext
	if not context:
		printerr("No game context found")
		return
	
	add_child(context)
	context.build()
	context.bind_dependencies()
	context.setup()
	
	context.main_menu_requested.connect(mount_main_menu)
