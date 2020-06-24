/// @description checking for condition first
// You can write your code in this editor
if i <= 7
{
	for(j=0;j<=7;j++)
	{
		if instance_exists(Gamerule_1.gem_board1[i,j])
		{
			if Gamerule_1.gem_board1[i,j].skinnum = 7
			{
				with(Gamerule_1.gem_board1[i,j]) delete_gem()
			}
			else instance_destroy(Gamerule_1.gem_board1[i,j],true)
		}
	}
	i++
	alarm[0] = 10
}
else
{
	#region secret
	if Gamerule_1.points >= 700000
	{
		if !file_exists("secrets.ini") file_create_secrets()
		var l = ds_list_create()
		ini_open("secrets.ini")
			var str = ini_read_string("secret","data","")
			ds_list_read(l,str)
			if l[| 2] == false
			{
				instance_create_depth(0,512,-99,obj_secretunlock)
				l[| 2] = true
				var str = ds_list_write(l)
				ini_write_string("secret","data",str)
			}
		ini_close()
	}
	#endregion
	
	Gamerule_1.gameover = true
	audio_play_sound(vo_gameover,0,0)
	instance_create(room_width/2,room_height - 720/2,obj_gameover_text)
	//create_text(spr_gameover,"stayer")
	alarm[1] = 300
	#region save replay
	if global.replay_match_allowed
{
	var timetouse = -1
	//var timetouse = "None";
	if Gamerule_1.time_allowed
	{/*
		var aa = global.timer div 60 // aa:bbcc timer
		var cc = global.timer mod 60
		var bb; if cc > 9 bb = "" else bb = "0"
		timetouse = string(aa)+":"+bb+string(cc)*/
		timetouse = global.timer
	}

	//var mystring = string(date_get_day(date_current_datetime())) + "-" + string(date_get_month(date_current_datetime())) + "-" + string(date_get_year(date_current_datetime()))	
	var num = 0
	var mydate = string(date_get_day(date_current_datetime())) + "-" + string(date_get_month(date_current_datetime())) + "-" + string(date_get_year(date_current_datetime()))	
	while file_exists("Replays/"+string(num) + ".rep")
	{
		num++
	}

	global.string_to_save = "Replays/"+ string(num) + ".rep"
	//var mystring = string(date_get_day(date_current_datetime())) + "-" + string(date_get_month(date_current_datetime())) + "-" + string(date_get_year(date_current_datetime()))	
	ini_open(global.string_to_save)
		var str = ds_map_write(Gamerule_1.Replay_match_map)
		ini_write_string("replay","data",str)
		ini_write_string("replay","date",mydate)
		ini_write_string("replay","time",timetouse)
		ini_write_string("replay","score",Gamerule_1.points)
		ini_write_real("replay","geode_xplier",Gamerule_1.geode_xplier)
	ini_close()
}
#endregion
}