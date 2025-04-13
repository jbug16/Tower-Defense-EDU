/// @description Sell Event


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
}
// If it is confirmed and the manager is confirmed 
else if (my_manager.confirmed) && (confirmed)
{
	if (!global.quiz_active)
	{
		// Store what kind of transaction this is
		global.transaction = "sell";
		
		// Store the base (so we can destroy it after placing the tower)
        global.pending_tower_base = my_manager.my_tower;
		
		// Spawn the quiz UI
        instance_create_layer(0, 0, "Instances", obj_quiz_manager);

		// Use the custom method to close the menu
		close_menu();
	}
}