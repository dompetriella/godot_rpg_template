extends Node
class_name HealthComponent

signal current_health_changed(old_value: int, new_value: int);

signal health_depleted;

@export var total_health: int = 10;
var current_health: int;

func _ready() -> void:
	current_health = total_health;
	
func take_damage(amount: int):
	var new_health: int = current_health - amount;
	current_health = new_health;
	self.current_health_changed.emit(current_health, new_health);
	
	if (current_health <= 0):
		self.health_depleted.emit();
	
