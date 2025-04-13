/// @description Upgrade Event


// Check if it is currently in the unconfirmed state
if (!confirmed)
{
	// If it is, then
	// Check whether the manager is in the confirmed state
	if (my_manager.confirmed)
	{
		// If it is, unconfirm it
		unconfirm_choice();
	}	
	
	// Confirm this choice
	confirm_choice();
	
	// Destroy any instance of the tower range
	instance_destroy(obj_tower_range);
	
	// Create a new instance of the tower range and access its variables using with
	with (instance_create_layer(my_manager.x, my_manager.y - 39, "TowerRange", obj_tower_range))
	{
		// Scale the x scale by remapping it's range and multiplying its current range by 1.25
		// This is what the range will be after upgrading the tower
		image_xscale = map_value((other.my_manager.my_tower.range * 1.25), 0, 260, 0, 1);
		
		// Set the yscale to be the same as xscale so we don't have to call map_value twice
		image_yscale = image_xscale;
	}

}
// If it is confirmed and the manager is confirmed
else if (my_manager.confirmed) && (confirmed)
{
	if (!global.quiz_active)
	{
		// Store what kind of transaction this is
		global.transaction = "upgrade";
		
		// Store the base (so we can destroy it after placing the tower)
        global.pending_tower_base = my_manager.my_tower;
		
		// Spawn the quiz UI
        instance_create_layer(0, 0, "Instances", obj_quiz_manager);

		// Use the custom method to close the menu
		close_menu();
	}
}