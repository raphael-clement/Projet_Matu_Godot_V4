extends Node

# Items

# Iventory
var inventory = {
	"wood" : 0,
	"iron" : 0
}

@onready var inv_label = $"../Player/Camera2D/HUD/Player Tab/Inventory/Label"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	#inv_label.set_text (inventory)
	if Input.is_action_just_pressed("ui_accept"):
		print(inventory)
