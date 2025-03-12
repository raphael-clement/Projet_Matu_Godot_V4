extends Node2D

###Ne contionne pas, faire tuto
@onready var Game_Control_Node = $Control
@onready var Control_Visibility = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	remove_child(Game_Control_Node)
	Control_Visibility = false



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("Escape-Game"):
		add_child(Game_Control_Node)
		Control_Visibility = true
	
	if Control_Visibility == true and Input.is_action_just_pressed("Escape-Game"):
		remove_child(Game_Control_Node) 
