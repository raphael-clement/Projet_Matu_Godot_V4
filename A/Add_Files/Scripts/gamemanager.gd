extends Node

# Items

# Iventory
var inventory = {
	"wood" : 0,
	"iron" : 0,
	"bones" : 0
}
var inv_str = str(inventory).replace(",", "\n").replace("{", "").replace("}", "")
@onready var inv_label = $"../Player/Camera2D/HUD/Player Tab/Inventory/Label"


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	inv_label.set_text (inv_str)
	#if Input.is_action_just_pressed("ui_accept"):
		#print(inventory)
