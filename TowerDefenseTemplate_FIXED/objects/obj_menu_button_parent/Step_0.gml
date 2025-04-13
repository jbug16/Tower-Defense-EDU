/// @description Tower Buy Parent


// Check whether or not a popup menu exists
if (!global.popup_menu_exists) 
{
	// If none exist, destroy this menu button
	instance_destroy(id);
}