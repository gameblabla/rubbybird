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

process gameplay()
local
p1_ok;
begin
    clear_screen();
	let_me_alone();
	
	stop_song();
	
	bird_y = 180;
	tmp = 0;
	p1_ok = 0;
	
	character_is_bird = 0;
	
	if (personnage_choosed < 4 || personnage_choosed == 5 || personnage_choosed == 8)
		character_is_bird = 1;
	end
	
	if (personnage_choosed == 9)
		fond_choosed = 1;
	elseif (personnage_choosed == 10)
		fond_choosed = 2;
	elseif (personnage_choosed == 13)
		fond_choosed = 3;
	else
		fond_choosed = 0;
	end
	
	exitgame();
	
	if (fond_choosed == 0)
		abackground_fond();
	else
		background_fond();
		background_fond2();
	end
	
	littlebirdY(bird_y);
	Controls();
	
	// Wait a bit before the player can start playing
		for(i=0;i<45;i++)
			Delete_text(ALL_TEXT);
			write(fnt,120,80,4,"GET READY !");
			
			frame;
		end
		
	text_onscreen();
	dd2 = 200;
		
	loop
	
		p1_ok = 0;
		
		if (bird_y >= 200 and frotter == 0) 
			bird_y = bird_y - 3;
		elseif (bird_y <= 210 and frotter == 1) 
			bird_y = bird_y + 3;
		end

		if (mode_ramu == 0)
			size_ramu = size_ramu + 3;
		elseif (mode_ramu == 1)
			size_ramu = size_ramu - 3;
		end
							
		if (size_ramu > 298)
			mode_ramu = 1;
		elseif (size_ramu < 101)
			mode_ramu = 0;
		end
	
		for(i=0;i<5;i++)
			if(os_id==1003) 
				if (multi_info(i, "ACTIVE") > 0 and multi_info (i, "X") > 10 and multi_info (i, "X") < 230 and multi_info (i, "Y") > 100)
					xm = multi_info (i, "X");
					ym = multi_info (i, "Y");
					p1_ok = 1;
				end
			else
				if (mouse.left == 1 and mouse.x > 10 and mouse.x < 230 and mouse.y > 100)
					xm = mouse.x;
					ym = mouse.y;
					p1_ok = 1;
				end
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
		
		if (B1_PRESSED==1 and commencer == 0)
		
			// If Music is enabled...
			if (My_struct.music_on == 1)
				if (personnage_choosed == 4)
					div_song = load_song("monk.ogg");
				elseif (personnage_choosed == 8)
					div_song = load_song("MIRIADA.ogg");
				elseif (personnage_choosed == 9)
					div_song = load_song("MIRIADA.ogg");
				//elseif (personnage_choosed == 10)
				//	div_song = load_song("touhoushit.ogg");
				else
					div_song = load_song("div.ogg");
				end
				play_song(div_song,-1);
			end
			
			commencer = 1;
		end
		
		frame;
	end
	
	guarda_opciones();
	
END




process gameover()
local
aa;
begin
	rand_seed(time());
	aa = rand(0,6);
    clear_screen();
	let_me_alone();
	
	rand_seed(1);
		
	fade (100 , 100 , 100 , 32 ) ;
	
	stop_wav(0);
	stop_wav(1);
	stop_wav(2);
	stop_wav(3);

	
	if (personnage_choosed == 4)
		div_song = load_song("monkdead.ogg");
		if (My_struct.music_on == 1)
			play_song(div_song,0);
		end
	elseif (personnage_choosed == 2)
		stop_song();
		if (My_struct.gfx_on == 1)
			play_wav(sound5,0,0);
		end
	else
		stop_song();
		if (My_struct.gfx_on == 1)
			play_wav(sound3,0,0);
		end
	end

	
	exitgame();
	
	Controls();
	fond_titlescreen(4);
	littlebirdGO();
	
	if (hour > My_struct.highscore_h)
		My_struct.highscore_h = hour;
		My_struct.highscore_m = min;
		My_struct.highscore_s = second;
	elseif (My_struct.highscore_h == hour and min > My_struct.highscore_m)
		My_struct.highscore_h = hour;
		My_struct.highscore_m = min;
		My_struct.highscore_s = second;
	elseif (My_struct.highscore_h == hour and min == My_struct.highscore_m and second > My_struct.highscore_s)
		My_struct.highscore_h = hour;
		My_struct.highscore_m = min;
		My_struct.highscore_s = second;
	end
			
	Save("savebird",My_Struct);

	write(fnt,120,100,4,(int)hour+":"+(int)min + ":"+(int)second);
			
	menu_swap(60,220,fpg1,41,100);
	menu_swap(180,220,fpg1,42,100);
	
	loop
		
		Delete_text(ALL_TEXT);
		write(fnt_gameover,120,70,4,"GAME OVER");
		
		if (aa == 0)
			write(petite_fnt,120,110,4,"OBAMA WINS");
			write(petite_fnt,120,130,4,"HUMANITY IS DEAD");
		elseif (aa == 1)
			write(petite_fnt,120,110,4,"YOU ARE DEAD");
			write(petite_fnt,120,130,4,"THERE'S NO HOPE");
		elseif (aa == 2)
			write(petite_fnt,120,110,4,"A GREAT HERO HAS FALLEN");
			write(petite_fnt,120,130,4,"MAY YOU REST IN PEACE");
		elseif (aa == 3)
			write(petite_fnt,120,110,4,"BIG COMPANIES WIN");
			write(petite_fnt,120,130,4,"HUMANITY IS ENSLAVED");
			write(petite_fnt,120,150,4,"FOREVER");
		elseif (aa == 4)
			write(petite_fnt,120,110,4,"GAMEBLABLA DOES NOT");
			write(petite_fnt,120,130,4,"APPROVE YOU");
		else
			write(petite_fnt,120,110,4,"SORRY, BUT YOU ARE");
			write(petite_fnt,120,130,4,"FINISHED... HERE");
		end
	
		if (touch_state == 1)
				if (ym > 185 and ym < 255 and xm > 24 and xm < 96)
					if (hour < 1 and min > 0)
						if (personnage_choosed < 3 || personnage_choosed == 5)
							exec(_P_NOWAIT, "https://twitter.com/intent/tweet?text= Rubbed the bird for "+(int)min+"m:"+(int)second+"s"+" Can you beat me ? #rubbybird", 0, 0);
						elseif (personnage_choosed == 3)
							exec(_P_NOWAIT, "https://twitter.com/intent/tweet?text= Rubbed ma bouyah for "+(int)min+"m:"+(int)second+"s"+" Can you beat me ? #rubbybird", 0, 0);
						elseif (personnage_choosed == 4)
							exec(_P_NOWAIT, "https://twitter.com/intent/tweet?text= Rubbed the monkey for "+(int)min+"m:"+(int)second+"s"+" Can you beat me ? #rubbybird", 0, 0);
						elseif (personnage_choosed == 6)
							exec(_P_NOWAIT, "https://twitter.com/intent/tweet?text= Rubbed a japanese girl for "+(int)min+"m:"+(int)second+"s"+" Can you beat me ? #rubbybird", 0, 0);
						else
							exec(_P_NOWAIT, "https://twitter.com/intent/tweet?text= Rubbed the bird for "+(int)min+"m:"+(int)second+"s"+" Can you beat me ? #rubbybird", 0, 0);
						end
						elseif (hour < 1 and min < 1)
							if (personnage_choosed < 3 || personnage_choosed == 5)
								exec(_P_NOWAIT, "https://twitter.com/intent/tweet?text= Rubbed the bird for "+(int)second+" seconds."+" Can you beat me ? #rubbybird", 0, 0);
							elseif (personnage_choosed == 3)
								exec(_P_NOWAIT, "https://twitter.com/intent/tweet?text= Rubbed ma bouyah for "+(int)second+" seconds."+" Can you beat me ? #rubbybird", 0, 0);
							elseif (personnage_choosed == 4)
								exec(_P_NOWAIT, "https://twitter.com/intent/tweet?text= Rubbed the monkey for "+(int)second+" seconds."+" Can you beat me ? #rubbybird", 0, 0);
							elseif (personnage_choosed == 6)
								exec(_P_NOWAIT, "https://twitter.com/intent/tweet?text= Rubbed the japanese girl for "+(int)second+" seconds."+" Can you beat me ? #rubbybird", 0, 0);
							else
								exec(_P_NOWAIT, "https://twitter.com/intent/tweet?text= Rubbed the bird for "+(int)second+" seconds."+" Can you beat me ? #rubbybird", 0, 0);
							end
						else
							if (personnage_choosed < 3 || personnage_choosed == 5)
								exec(_P_NOWAIT, "https://twitter.com/intent/tweet?text= Rubbed the bird bird for "+(int)hour+"h:"+(int)min+"m:"+(int)second+"s"+" Can you beat me ? #rubbybird", 0, 0);
							elseif (personnage_choosed == 3)
								exec(_P_NOWAIT, "https://twitter.com/intent/tweet?text= Rubbed ma bouyah for "+(int)hour+"h:"+(int)min+"m:"+(int)second+"s"+" Can you beat me ? #rubbybird", 0, 0);
							elseif (personnage_choosed == 4)
								exec(_P_NOWAIT, "https://twitter.com/intent/tweet?text= Rubbed the monkey monkey for "+(int)hour+"h:"+(int)min+"m:"+(int)second+"s"+" Can you beat me ? #rubbybird", 0, 0);
							elseif (personnage_choosed == 6)
								exec(_P_NOWAIT, "https://twitter.com/intent/tweet?text= Rubbed a japanese girl for "+(int)hour+"h:"+(int)min+"m:"+(int)second+"s"+" Can you beat me ? #rubbybird", 0, 0);
							else
								exec(_P_NOWAIT, "https://twitter.com/intent/tweet?text= Rubbed the bird for "+(int)hour+"h:"+(int)min+"m:"+(int)second+"s"+" Can you beat me ? #rubbybird", 0, 0);
							end
						end
					elseif ((ym > 185 and ym < 255 and xm > 144 and xm < 215) || (scan_code==102 and os_id==1003))
					
						div_song = load_song("2014_02_wip.ogg");
						if (My_struct.music_on == 1)
							play_song(div_song,-1);
						end
						
						stop_wav(0);
						stop_wav(1);
						stop_wav(2);
						stop_wav(3);
						Load("savebird",My_Struct);
						menu();
						
					end
		end
		
	
		
		frame;
	end
END


process text_onscreen()
local
once = 0;
begin
	loop
	
		Delete_text(ALL_TEXT);
		
		if (commencer == 1)
		
			write(fnt,120,80,4,(int)hour + ":"+(int)min + ":"+(int)second);
			write(petite_fnt,180,94,4,(int)micro);
			
			micro++;
			tmp++;
			
			if (character_is_bird == 1)
				if (second == 5 and hour == 0 and min == 0 and once == 0)
					if (My_struct.gfx_on == 1)
						play_wav(voice1,0,0);
					end
					once = 1;
				end
				
				if (second == 15 and once == 0)
					if (My_struct.gfx_on == 1)
						play_wav(voice2,0,0);
					end
					once = 1;
				end
				
				if (second == 17 and once == 0)
					if (My_struct.gfx_on == 1)
						play_wav(voice5,0,0);
					end
					once = 1;
				end
				
				if (second == 30 and once == 0)
					if (My_struct.gfx_on == 1)
						play_wav(voice2,0,0);
					end
					once = 1;
				end
				
				if (second == 45 and once == 0)
					if (My_struct.gfx_on == 1)
						play_wav(voice1,0,0);
					end
					once = 1;
				end
				
				if (second == 47 and once == 0)
					if (My_struct.gfx_on == 1)
						play_wav(voice5,0,0);
					end
					once = 1;
				end
				
				if (second == 59 and once == 0)
					if (My_struct.gfx_on == 1)
						play_wav(voice1,0,0);
					end
					once = 1;
				end
				
				if (hour == 9 and second == 0 and once == 0)
					if (My_struct.gfx_on == 1)
						play_wav(voice3,0,0);
					end
					once = 1;
				end
				
				if (hour == 29 and second == 0 and once == 0)
					if (My_struct.gfx_on == 1)
						play_wav(voice4,0,0);
					end
					once = 1;
				end
			end
				
			if (micro > 29)
				My_struct.second_money = My_struct.second_money + 1;
				second = second + 1;
				micro = 0;
				once = 0;
			end
			
			if (second > 59)
				second = 0;
				min++;
			end
			
			if (min > 59)
				min = 0;
				hour++;
			end
			
			if (hour == 0 and min == 0 and second < 10)
				if (tmp > 40)
					gameover();
				end
				
				if (tmp > 25)
					fade (200 , 100 , 100 , 16 ) ;
				else
					fade (100 , 100 , 100 , 16 ) ;
				end
			else
				if (tmp > 22)
					gameover();
				end
				
				if (tmp > 15)
					fade (200 , 100 , 100 , 16 ) ;
				else
					fade (100 , 100 , 100 , 16 ) ;
				end
			end
			
			counter++;
			
		else
			write(fnt,120,80,4,"RUB IT");
		end
		
	frame;
	end
	
end
