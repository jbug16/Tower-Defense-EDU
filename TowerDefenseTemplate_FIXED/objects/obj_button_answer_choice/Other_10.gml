/// @description Menu Button

// Answer question
show_debug_message("clicked answer button");
if (answer_index == global.current_question_data.answer) 
{
    // Place the tower at the saved location
    instance_create_depth(global.target_x, global.target_y, 0, global.pending_tower_type);

    // Destroy the tower base placeholder
    with (global.pending_tower_base) instance_destroy();

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
