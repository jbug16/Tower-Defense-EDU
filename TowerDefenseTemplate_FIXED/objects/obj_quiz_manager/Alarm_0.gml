// Set the answers to the correct buttons
var count = 0;
with (obj_button_answer_choice) 
{
    answer_index = count;
    text = global.current_question_data.options[count];
    count += 1;
}

show_debug_message("Running Alarm[0] in quiz manager.");