extends Button


@export var inv : Inventory
@export var id : int;
@export var item_name : String;
@export var item_icon : Texture2D;
@export var max_qty : int;
@export var qty : int;

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pressed.connect(add_new_item);

func add_new_item() -> void:
	var item = Item.new();
	
	item.ID = id;
	item.Name = item_name;
	item.Icon = item_icon;
	item.max_qty = max_qty;
	item.qty = qty;
	
	inv.add_inventory_item(item);
