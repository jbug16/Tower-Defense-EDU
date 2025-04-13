/// @description Tower Buy Parent


// Check if it is currently in the unconfirmed state and if the player can afford it
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
	
	// Create an instance of obj_tower_range to show the player what the range will be
	instance_create_layer(my_manager.x, my_manager.y - 39, "TowerRange", obj_tower_range);
	
}
// If it is confirmed and the manager is confirmed
else if (my_manager.confirmed) && (confirmed) 
{
	if (!global.quiz_active) 
	{
        //global.quiz_active = true;

        // Store the tower type and position for later placement
        global.pending_tower_type = my_tower;
        global.target_x = my_manager.x;
        global.target_y = my_manager.y;

        // Also store the base (so we can destroy it after placing the tower)
        global.pending_tower_base = my_manager.my_tower;

        // Spawn the quiz UI
        instance_create_layer(0, 0, "Instances", obj_quiz_manager);

        // Close the build menu visually
        close_menu();
    }
	
}