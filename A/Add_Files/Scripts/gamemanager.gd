extends Node

# Items
var wood_count : int = 0
var iron_count : int = 0
var bones_count : int = 0
# Iventory
var inventory = {
	"wood" : wood_count,
	"iron" : iron_count,
	"bones" : bones_count
}
var inv_str = str(inventory).replace(",", "\n").replace("{", "").replace("}", "").replace('"', "")
@onready var inv_label = $"../Player/Camera2D/HUD/Player Tab/Inventory/Label"




# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	inv_label.set_text (inv_str)
	#if Input.is_action_just_pressed("ui_accept"):
		#print(inventory)
