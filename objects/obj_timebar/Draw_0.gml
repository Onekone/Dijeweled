/// @description Insert description here
//draw_text(x,y+64,string((obj_score.scoretemp-previous_points)))
draw_sprite(spr_lvlbar_bot,0,x-8,y)
draw_sprite_part(spr_flow,image_index,0,0,(time_now/time_full)*bar_end,32,x,y+8)
draw_sprite(spr_lvlbar_top,0,x-8,y)
var k = floor(time_now)
if k <= 0 k = 0
var t = string(k div 60)+":"+(k mod 60 >= 10 ? string(k mod 60) : "0"+string(k mod 60))
draw_text_outline_transformed(x+256,y+24,t,c_white,c_black,0.75)
/*draw_text_transformed_colour(x+258,y+26,t,0.75,0.75,0,0,0,0,0,1);
draw_text_transformed_colour(x+256,y+24,t,0.75,0.75,0,c_white,c_white,c_white,c_white,1);*/