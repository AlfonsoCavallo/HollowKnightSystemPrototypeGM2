//SE E' CLICCATO CON MOUSE O CLICCANDO INVIO RITORNA ALLA WHITEBOX
if((Cursor_obj.leftClick == true && place_meeting(x,y,Cursor_obj)) || keyboard_check_pressed(vk_enter)) {
	room_goto(Whitebox_room);
}