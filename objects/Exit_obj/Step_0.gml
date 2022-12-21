//SE E' CLICCATO CON MOUSE O CLICCANDO ESC ESCE DAL GIOCO
if((Cursor_obj.leftClick == true && place_meeting(x,y,Cursor_obj)) || keyboard_check_pressed(vk_escape)) {
	game_end();
}