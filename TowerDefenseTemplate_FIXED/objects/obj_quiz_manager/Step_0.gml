if (global._unlock_timer_pending) 
{
	show_debug_message("unlock timer is pending...");
    var elapsed = (get_timer() - global._unlock_timer_start) / 1000000;
    if (elapsed >= 1) 
	{
        global.menu_lock = false;
		show_debug_message("menu is unlocked");
        global._unlock_timer_pending = false;
    }
}