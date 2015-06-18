
process gameplay()
begin
    clear_screen();
	let_me_alone();
	
	stop_song();
	
	bird_y = 100;
	tmp = 0;
	mojo = 0;
	
	if (personnage_choosed == 9)
		fond_choosed = 1;
	elseif (personnage_choosed == 10)
		fond_choosed = 2;
	elseif (personnage_choosed == 13)
		fond_choosed = 3;
	else
		fond_choosed = 0;
	end
	
	
	hand();
	
	if (fond_choosed == 0)
		abackground_fond();
	else
		background_fond();
		background_fond2();
	end
	
	littlebirdY(bird_y);
	Controls();
	
		for(i=128;i>0;i--)
		Delete_text(ALL_TEXT);
		write(fnt,160,16,4,"GET READY !");
		write(fnt,160,32,4,i);
		write(fnt,160,156,4,"USE THE TOUCHPAD");
			frame;
		end
		
		if (personnage_choosed == 4)
				div_song = load_song("monk.ogg");
		elseif (personnage_choosed == 8)
				div_song = load_song("MIRIADA.ogg");
		elseif (personnage_choosed == 10)
				div_song = load_song("touhoushit.ogg");
		else
				div_song = load_song("div.ogg");
		end
			
			play_song(div_song,-1);
			
			commencer = 1;
			text_onscreen();
			dd2 = 200;
	
	loop

	
		
				if (mode_touhou == 0)
					size_touhou = size_touhou + 3;
				elseif (mode_touhou == 1)
					size_touhou = size_touhou - 3;
				end
							
				if (size_touhou > 298)
					mode_touhou = 1;
				elseif (size_touhou < 101)
					mode_touhou = 0;
				end
	
		
		
			if (frotter == 0)
				if (bird_y >= 100) 
				bird_y = bird_y - 1;
				end
				
				if (dd2 < mmy)
					count = count + 1;
				elseif (dd2 > mmy)
					count = count + 1;
				end
				
				if (count > 5)
				tmp = 0;
				frotter = 1;
				dd2 = mmy;
				count = 0;
				end
				
			elseif (frotter == 1)
				if (bird_y <= 110) 
				bird_y = bird_y + 1;
				end
				
				if (dd2 < mmy)
					count = count + 1;
				elseif (dd2 > mmy)
					count = count + 1;
				end
				
				if (count > 5)
				tmp = 0;
				frotter = 0;
				dd2 = mmy;
				count = 0;
				end
			end

		/*
		if (B3_PRESSED==1 and commencer == 0)
		

			
			commencer = 1;
		end
		*/
		frame;
	end
	
	//guarda_opciones();
	
END




process gameover()

	local

	x_menu1 = 400;
	x_menu2 = 410;
	x_menu3 = 420;

begin

    clear_screen();
	let_me_alone();
	
	fade (100 , 100 , 100 , 32 ) ;
	
	stop_wav(0);
	stop_wav(1);
	stop_wav(2);
	stop_wav(3);
	
			if (personnage_choosed < 2 || personnage_choosed == 5)
				play_wav(sound15,0,0);
				stop_song();
			elseif (personnage_choosed == 4)
				div_song = load_song("monkdead.ogg");
				play_song(div_song,0);
			else
				stop_song();
				play_wav(sound3,0,0);
			end

	
	
	
	Controls();
	fond_titlescreen(4);
	littlebirdGO();

	Delete_text(ALL_TEXT);
	write(fnt_gameover,160,16,4,"GAME OVER");
	
	
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

			write(fnt,160,36,4,(int)hour+":"+(int)min + ":"+(int)second);
			write(fnt,112,160,4,"HIGHSCORE: ");
			write(fnt,256,160,4,My_struct.highscore_h+":"+My_struct.highscore_m + ":"+My_struct.highscore_s);
			
			
			write(fnt_gameover,160,88,4,"PRESS ANY BUTTON");
			write(fnt_gameover,160,104,4,"TO CONTINUE");
	loop

		
		if (B3_PRESSED==1 || B4_PRESSED ==1)
						div_song = load_song("2014_02_wip.ogg");
						play_song(div_song,-1);
						stop_wav(0);
						stop_wav(1);
						stop_wav(2);
						stop_wav(3);
						Load("savebird",My_Struct);
						menu();
		end

		
	
		
		frame;
	end
	//guarda_opciones();
	
END


process text_onscreen()
begin
	loop
	
		Delete_text(ALL_TEXT);
		
		if (commencer == 1)
		
			write(fnt,160,16,4,(int)hour + ":"+(int)min + ":"+(int)second);
			write(petite_fnt,160,32,4,micro/2);
			
			micro++;
			tmp++;
			
			if (micro > 59)
				My_struct.second_money = My_struct.second_money + 1;
				second = second + 1;
				micro = 0;
			
					if (second == 15)
						if (personnage_choosed < 4 || personnage_choosed == 5) 
							play_wav(sound9,0,1);	// Good job ! Keep rubbing the bird !
						else
							play_wav(sound16,0,1);	// Good job ! Keep rubbin' !
						end
					end	
					
					if (second == 45)
						play_wav(sound2,0,1);	// Keep it up !
					end	
					
					if (second == 48)
						play_wav(sound11,0,1);	// Rub it up !
					end	
					
					if (second == 51)
						play_wav(sound12,0,1);	// Fuck it up !
					end		
			end
			
			if (second > 59)
			second = 0;
			min++;
			
				if (hour < 9)
					if (personnage_choosed < 4 || personnage_choosed == 5) 
						play_wav(sound9,0,1);	// Good job ! Keep rubbing the bird !
					else
						play_wav(sound16,0,1);	// Good job ! Keep rubbin' !
					end
				end
				
			end
			
			if (min > 59)
			min = 0;
			hour++;
			
					if (hour == 9)
					
						if (personnage_choosed < 4 || personnage_choosed == 5) 
							play_wav(sound8,0,1);	// You've been rubbing the bird for 9 hours straight , keep it up
						else
							play_wav(sound17,0,1);	// You've been rubbing for 9 hours straight , keep it up
						end

					end
					
					if (hour == 29)
					
						if (personnage_choosed < 4 || personnage_choosed == 5) 
							play_wav(sound8,0,1);	// You've been rubbing the bird for 29 hours straight , keep it up
						else
							play_wav(sound18,0,1);	// You've been rubbing for 29 hours straight , keep it up
						end
						
					end
				
			end
			
			if (hour == 0 and min == 0 and second < 10)
			
				if (tmp > 59)
					gameover();
				end
				
				if (tmp > 25)
					fade (200 , 100 , 100 , 16 ) ;
				else
					fade (100 , 100 , 100 , 16 ) ;
				end
				
			else
			
				if (tmp > 44)
					gameover();
				end
				
				if (tmp > 25)
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
