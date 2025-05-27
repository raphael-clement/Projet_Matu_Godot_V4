class_name Inventory

extends ItemList

@export var inventory_size : int = 20;
@export var blank_icon : Texture2D;

var items : Array[Item];

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for i in inventory_size:
		add_item(" ", blank_icon);
		items.append(null);
	
	item_clicked.connect(on_inventory_item_clicked);


func add_inventory_item(item : Item) -> bool:
	if item == null or item.qty <= 0:
		return false;
	
	var could_pickup : bool = add_stackable_item(item);
	
	if item.qty <= 0:
		return true;
	
	for i in inventory_size:
		if items[i] != null:
			continue;
		
		items[i] = item;
		set_item_icon(i, item.Icon);
		
		if(item.max_qty > 1):
			set_item_text(i, str(items[i].qty));
			
		return true;
	
	return could_pickup
	
func add_stackable_item(item : Item) -> bool:
	if item.max_qty < 2:
		return false;
	
	var could_pickup : bool = false;
	
	for i in inventory_size:
		if items[i] == null:
			continue;
		
		if items[i].ID != item.ID or items[i].qty >= items[i].max_qty:
			continue;
			
		if items[i].qty + item.qty > items[i].max_qty:
			var amount_to_remove : int = items[i].max_qty - items[i].qty;
			
			items[i].qty = items[i].max_qty;
			
			item.qty = item.qty - amount_to_remove;
			
			could_pickup = true;
			set_item_text(i, str(items[i].qty));
			continue;
		
		items[i].qty = item.qty + items[i].qty;
		
		item.qty = 0;
		set_item_text(i, str(items[i].qty));
		return true;
		
	return could_pickup;


func remove_incentory_item(index : int) -> void:
	if index < 0 or index >= inventory_size:
		return;
	
	items[index] = null;
	set_item_icon(index, blank_icon);
	set_item_text(index, " ");
	
func get_inventory_item(index : int) -> Item:
	if index < 0 or index >= inventory_size:
		return null;
	
	return items[index];

func on_inventory_item_clicked(index : int, pos : Vector2, mouse_button_index : int) -> void:
	if mouse_button_index == 2:
		var item = get_inventory_item(index);
		
		if item == null:
			print("No items here!");
			return;
	
		remove_inventory_item(index);
	
		print("you dropped " + item.Name + " and there were a total of " + str(item.qty));
	elif mouse_button_index == 1:
		var item = get_inventory_item(index);
		
		if item == null:
			print("No items here!");
			return;
		
		print("You clicked on " + item.Name + " there are " + str(item.qty) + " of them");
