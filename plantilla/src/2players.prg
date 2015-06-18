/*

	Copyright (C) 2015  Gameblabla
	Licensed under the GAMEBLABLA's LICENSE version 3.4
	
	See COPYING file for more details.
	If a COPYING file was not provided, you may obtain a copy of the License at
	
		http://gameblabla.olympe.in/license/
		
	This Program is distributed without WITHOUT ANY WARRANTY; 
	without even the implied warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  
	See the GAMEBLABLA's LICENSE for more details.

	Exceptions to Section 2 (c) as allowed by Section 2 (i) are Google Inc. and anyone involved behind GetJar (www.getjar.com) and AppsLib (www.appslib.com)
*/


process gameplayP2()
local
p1_ok;
p2_ok;
i;
begin
    clear_screen();
	let_me_alone();
	stop_song();

	exitgame();
	Controls();
	
	abackground_fond();
		
	bird_y = 200;
	bird_y2 = 200;
		
	littlebirdP1(60,bird_fpg);
	littlebirdP2(180,bbird_fpg,400);
	
	for(i=0;i<90;i++)
		Delete_text(ALL_TEXT);
		write(fnt,120,80,4,"THE LAST");
		write(fnt,120,100,4,"STANDING WINS");
		write(fnt,120,290,4,"GET READY !");
		frame;
	end
		
	text_onscreenP2_multi();
	
	dd2 = 200;
	dd3 = 200;
	commencer = 1;
	
	tmp = 0;
	tmp2 = 0;
	count = 0;
	count2 = 0;
	frotter = 0;
	frotter2 = 0;
	
	lost_p1 = 0;
	lost_p2 = 0;
	
	div_song = load_song("div.ogg");
	if (My_struct.music_on == 1)
		play_song(div_song,-1);
	end
		
	loop
	
		p1_ok = 0;
		p2_ok = 0;
		
		// Used for controlling Player 2
		
		for(i=0;i<5;i++)
			if (multi_info(i, "ACTIVE") > 0 and multi_info (i, "X") < 120 and multi_info (i, "Y") > 90)
				xm = multi_info (i, "X");
				ym = multi_info (i, "Y");
				p1_ok = 1;
			end
		end

		// Used for controlling Player 1
		if (p1_ok == 1) 
			if (frotter == 0)
				
				if (dd2 < ym)
					count = count + 1;
				elseif (dd2 > ym)
					count = count + 1;
				end
				
				if (count > 3)
				tmp = 0;
				frotter = 1;
				dd2 = ym;
				count = 0;
				end
				
			elseif (frotter == 1)

				if (dd2 < ym)
					count = count + 1;
				elseif (dd2 > ym)
					count = count + 1;
				end
				
				if (count > 3)
				tmp = 0;
				frotter = 0;
				dd2 = ym;
				count = 0;
				end
			end
		end
		
				if (bird_y >= 200 and frotter == 0) 
					bird_y = bird_y - 3;
				elseif (bird_y <= 210 and frotter == 1) 
					bird_y = bird_y + 3;
				end
		
				if (bird_y2 >= 200 and frotter2 == 0) 
					bird_y2 = bird_y2 - 3;
				elseif (bird_y2 <= 210 and frotter2 == 1) 
					bird_y2 = bird_y2 + 3;
				end
		
		
		// Used for controlling Player 2
		
		for(i=0;i<5;i++)
			if (multi_info(i, "ACTIVE") > 0 and multi_info (i, "X") > 125 and multi_info (i, "Y") > 90)
				xm2 = multi_info (i, "X");
				ym2 = multi_info (i, "Y");
				p2_ok = 1;
			end
		end
		
		
		if (p2_ok == 1)
			if (frotter2 == 0)
				if (dd3 < ym2)
					count2 = count2 + 1;
				elseif (dd3 > ym2)
					count2 = count2 + 1;
				end
				
				if (count2 > 3)
				tmp2 = 0;
				frotter2 = 1;
				dd3 = ym2;
				count2 = 0;
				end
				
			elseif (frotter2 == 1)
				if (dd3 < ym2)
					count2 = count2 + 1;
				elseif (dd3 > ym2)
					count2 = count2 + 1;
				end
				
				if (count2 > 3)
				tmp2 = 0;
				frotter2 = 0;
				dd3 = ym2;
				count2 = 0;
				end
			end
		end
		
		
		frame;
	end
END




process gameoverP2_multi()
begin
    clear_screen();
	let_me_alone();
	
	stop_wav(0);
	stop_wav(1);
	stop_wav(2);
	unload_song(div_song);
	
	div_song = load_song("victory.ogg");
	
	if (My_struct.music_on == 1)
		play_song(div_song,0);
	end
	
	exitgame();
	
	Controls();
	abackground_fond();
	
	if (lost_p1 == 1)
		littlebirdP2GO(60,bird_fpg);
	else
		littlebirdP1(60,bird_fpg);
	end
	
	if (lost_p2 == 1)
		littlebirdP2GO(180,bbird_fpg);
	else
		littlebirdP2(180,bbird_fpg,400);
	end
				
	tmp = 0;
	tmp2 = 0;
	tap_time = 0;
	
	Save("savebird",My_Struct);
	
	loop
	
	Delete_text(ALL_TEXT);
	
	if (lost_p1 == 1)
		write(fnt2,120,70,4,"PLAYER 2 WINS");
	else
		write(fnt2,120,70,4,"PLAYER 1 WINS");
	end
		
	if (tap_time < 29)
		write(fnt,120,120,4,(int)min + ":"+(int)second);
		write(petite_fnt,160,134,4,(int)micro);
	end
		
	if (tmp > 30 and touch_state == 1) 
		titlescreen();
	end
			
	tap_time++;
	
	if (tap_time > 39)
		tap_time = 0;
	end
			
	tmp++;	
		
	frame;
	end
END


process text_onscreenP2_multi()
begin
	loop
		Delete_text(ALL_TEXT);
		
		if (commencer == 1)
			write(fnt,120,80,4,(int)min + ":"+(int)second);
			write(petite_fnt,160,94,4,(int)micro);
		
			micro++;
			
			tmp++;
			tmp2++;
			
			if (micro > 29)
			second = second + 1;
			My_struct.second_money++;
			micro = 0;
			end
			
			if (second > 59)
			second = 0;
			min++;
			end
			
			if (min > 59)
			min = 0;
			hour++;
			end
			
			if (hour == 0 and min == 0 and second < 7)
				if (tmp > 70)
				lost_p1 = 1;
				gameoverP2_multi();
				end 
				
				if (tmp2 > 70)
				lost_p2 = 1;
				gameoverP2_multi();
				end
			else
				if (tmp > 20)
				lost_p1 = 1;
				gameoverP2_multi();
				end 
				
				if (tmp2 > 20)
				lost_p2 = 1;
				gameoverP2_multi();
				end
			end
			

		end
		
	frame;
	end
	
end
