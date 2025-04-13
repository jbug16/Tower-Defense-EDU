/// @description Start Button

// Set question level
global.selected_level = level;

// Go to the level
room_goto(rm_level_1);

// Play the button press sound effect
audio_play_sound(snd_button_click, 0, false);
