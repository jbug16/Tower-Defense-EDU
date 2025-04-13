/// @description Menu Button

// Answer question
show_debug_message("clicked answer button");
if (answer_index == global.current_question_data.answer) 
{
	if (global.transaction == "buy")
	{
		show_debug_message("BUY");
	    // Place the tower at the saved location
	    instance_create_depth(global.target_x, global.target_y, 0, global.pending_tower_type);

	    // Destroy the tower base placeholder
	    with (global.pending_tower_base) instance_destroy();
	}
	else if (global.transaction == "upgrade")
	{
		show_debug_message("UPGRADE");
		
		// Use with to access the tower that spawned this button
		with (global.pending_tower_base) 
		{
			// Use the built in function event_perform to perform user event 1, 
			// which is the tower's level up event
			event_perform(ev_other, ev_user1);
		}
	}
	else if (global.transaction == "sell")
	{
		show_debug_message("SELL");
		
		// Use with to access the tower that spawned this button
		with (global.pending_tower_base) 
		{
			// Create a new tower base where this tower is located
			instance_create_layer(x, y,  "Instances", obj_tower_base);
		
			// Destroy this tower
			instance_destroy(id);
		
			// Create an instance of the sell sequence
			layer_sequence_create("Sequences", x, y, seq_tower_sell);
		
			// Play a random tower sell sound
			audio_play_sound(choose(snd_tower_sell_01, snd_tower_sell_02, snd_tower_sell_03), 10, false);
		}
	}

    // Clean up the quiz sequence + manager
    with (obj_quiz_manager) 
	{
		active_quiz();
        instance_destroy(); // remove the quiz manager
    }
} 
else
{
	audio_play_sound(snd_button_no_click, 0, false);
}

// Play the button press sound effect
audio_play_sound(snd_button_click, 0, false);
