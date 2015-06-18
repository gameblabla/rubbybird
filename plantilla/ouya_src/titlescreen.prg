process presstostart()
begin
	file = fpg1;
	graph = 15;
	x = 160;
	y = 150;
	z = -1;
	size = 100;
	
	loop
			alpha = alpha_title;
		frame;
	end
END


process titlescreen()
local
tap_time2;
begin
    clear_screen();
	let_me_alone();
	stop_song();
	
	fond_choosed = 0;
	bird_y = 90;
	
	
	Controls();
	fond_titlescreen(4);
	littlebird_titlescreen();
	presstostart();
	
	tmp = 0;
	commencer = 0;
	hour = 0;
	min = 0;
	second = 0;
	micro = 0;
	frotter = 0;
	
	play_wav(sound10,0,0);	// Rubby Bird !
	tap_time = 0;
	tap_time2 = 0;
	

	loop
		
		Delete_text(ALL_TEXT);
		perso(30,307,fpg1,8,100);
		write(fnt,160,20,4,"RUBBY BIRD");
		
		tap_time++;
		
		if (tap_time < 30)
			alpha_title = alpha_title - 10;
		elseif (tap_time < 60)
			alpha_title = alpha_title + 10;
		elseif (tap_time < 90)
			alpha_title = alpha_title + 10;	
		elseif (tap_time > 99)
			alpha_title = 255;
			tap_time = 0;
		end
		
		tap_time2++;
		if (tap_time2 < 25)
			bird_y = bird_y + 1;
		elseif (tap_time2 < 50)
			bird_y = bird_y - 1;
		elseif (tap_time2 > 49)
			bird_y = 90;
			tap_time2 = 0;
		end
		
		if (B3_PRESSED==1)
			if (tmp > 9)
					tmp = 0;
					div_song = load_song("2014_02_wip.ogg");
					play_song(div_song,-1);
					menu();
			end
		end
		
		if (tmp < 20)
			tmp++;
		end
		


		frame;
	end
	
	//guarda_opciones();
	
END




process menu()
local
x_menu1 = 320;
x_menu2 = 330;
x_menu3 = 340;
begin
    clear_screen();
	let_me_alone();
	
	
	Controls();
	fond_titlescreen(4);
	
	choice_x = 160;
	choice_y = 32+(ch*40);
	
	hand_control(choice_x,choice_y);
	
	back();
	
	fond_choosed = 0;
	tmp = 0;
	commencer = 0;
	hour = 0;
	min = 0;
	second = 0;
	micro = 0;
	frotter = 0;
	tap_time = 0;
	
	loop
		
		Delete_text(ALL_TEXT);
		//menu_swap(x_menu1,120,fpg1,21,100);
		menu_swap(x_menu1,30,ouyaa,1,100);
		menu_swap(x_menu2,70,ouyaa,2,100);
		menu_swap(x_menu2,110,ouyaa,3,100);
		menu_swap(x_menu3,150,ouyaa,4,100);
		
		write(little,8,8,0,"Highscore: ");
		write(little,8,20,0,+My_struct.highscore_h+":"+My_struct.highscore_m+":"+My_struct.highscore_s);
		//write(little,120,90,4,+My_struct.highscore_h+" h, "+My_struct.highscore_m+" m, "+My_struct.highscore_s+" s");
		
		choice_y = 32+(ch*40);
		
		if (x_menu1 > 240) 
			x_menu1 = x_menu1 - 5;
		end
		if (x_menu2 > 240) 
			x_menu2 = x_menu2 - 5;
		end
		if (x_menu3 > 240) 
			x_menu3 = x_menu3 - 5;
		end
		
		if (tmp > 11)
			if (B3_PRESSED==1)
					if (ch == 0)
						play_wav(sound4,0,0);
						choose_character();
					elseif (ch == 1)
						play_wav(sound4,0,0);
						shop();
					elseif (ch == 2)
						play_wav(sound4,0,0);
						about();
					elseif (ch == 3)
						EXIT(0,0);
					end
					
				tmp = 0;	
				B3_PRESSED = 0;
			end
			
			if (UP_PRESSED==1 and ch > 0)
				ch = ch - 1;
				tmp = 0;
			elseif (DOWN_PRESSED==1 and ch < 3)
				ch = ch + 1;
				tmp = 0;
			end

			
		end
		

		
		if (tmp < 20)
		tmp++;
		end
		
		frame;
	end
	
	//guarda_opciones();

END




process about()
local
time,credit_y=240;
begin
    clear_screen();
	let_me_alone();
	
	fond_choosed = 1;
	
	fond_titlescreen(4);
	
	Controls();
	back();
	
	
	tmp = 0;
	commencer = 0;
	hour = 0;
	min = 0;
	second = 0;
	micro = 0;
	frotter = 0;
	tap_time = 0;

	loop
	
		Delete_text(ALL_TEXT);
		
		time += 1;
		if (time > 1)
			credit_y = credit_y - 1;
			time = 0;
		end
		
		write(fnt,16,credit_y-16,0,"CREDITS");
		write(little,16,credit_y+24,0,"GRAPHICS, PROGRAMMING");
		write(little2,16,credit_y+(24*2),0,"GAMEBLABLA");
		
		write(little,16,credit_y+(24*4),0,"MUSIC/GFX (w/ changes)");
		write(little,16,credit_y+(24*5),0,"Gameblabla");
		write(little,16,credit_y+(24*6),0,"LUIS LOPEZ MARTINEZ");
		write(little,16,credit_y+(24*8),0,"BoxCat Games");
		write(little,16,credit_y+(24*9),0,"tinyurl.com/2v352h");
		write(little,16,credit_y+(24*10),0,"Jesus Latra");
		write(little,16,credit_y+(24*11),0,"tinyurl.com/yqontc");
		
		write(little2,16,credit_y+(24*13),0,"FONTS");
		write(little,16,credit_y+(24*14),0,"CodeMan83");	
		
		
		if (tmp > 5)
			if (B4_PRESSED)
				menu();
			end
		end
		
		if (credit_y < -340)
			menu();
		end
		
		if (tmp < 20)
			tmp++;
		end

		frame;
	end
	
	//guarda_opciones();
	
END


process shop()
local
menu_choose = 0; 
begin
    clear_screen();
	let_me_alone();
	
	
	Controls();
	fond_titlescreen(4);
	
	tmp = 0;
	commencer = 0;
	hour = 0;
	min = 0;
	second = 0;
	micro = 0;
	frotter = 0;
	tap_time = 0;
	
	back();
	
	loop
		Delete_text(ALL_TEXT);
		
		if (menu_choose > 0)
			perso(60,140,fpg1,4,100); //<--
		end
		
		if (menu_choose < 6)
			perso(240,140,fpg1,3,100); //-->
		end
		
		if (menu_choose == 0)
		
			perso(160,100,tuc_fpg,My_struct.perso1_unlocked,400); // TUC
			
				if (My_struct.perso1_unlocked < 2)
					write(little2,224,60,0,"1000 Pts");
				end
				
		elseif (menu_choose == 1)
			perso(160,100,haku_fpg,My_struct.perso2_unlocked,375); // HAKU
			
				if (My_struct.perso2_unlocked < 2)
					write(little2,224,60,0,"42 Pts");
				end
				
		elseif (menu_choose == 2)
			perso(160,100,ouya_fpg,My_struct.perso3_unlocked,200); // OUYA
			
				if (My_struct.perso3_unlocked < 2)
					write(little2,224,60,0,"666 Pts");
				end
				
		elseif (menu_choose == 3)
			perso(160,100,fenix_fpg,My_struct.perso4_unlocked,200); // FENIX
			
				if (My_struct.perso4_unlocked < 2)
					write(little2,224,60,0,"9001 Pts");
				end
			
		elseif (menu_choose == 4)
			perso(160,100,coin_fpg,My_struct.perso5_unlocked,200); // COINYE
			
				if (My_struct.perso5_unlocked < 2)
					write(little2,224,60,0,"4444 Pts");
				end
			
		elseif (menu_choose == 5)
			perso(160,100,reimu_fpg,My_struct.perso6_unlocked,250); // REIMU
			
				if (My_struct.perso6_unlocked < 2)
					write(little2,224,60,0,">50,<200 Pts");
				end
			
		elseif (menu_choose == 6)
			perso(160,100,kachoo_fpg,My_struct.perso7_unlocked,200); // KAKACHOO
			
				if (My_struct.perso7_unlocked < 2)
					write(little2,224,60,0,"151 Pts");
				end
				
		end
		
		if (My_struct.perso1_unlocked == 2 and My_struct.perso2_unlocked == 2 and My_struct.perso3_unlocked == 2 and My_struct.perso4_unlocked == 2 and My_struct.perso5_unlocked == 2 and My_struct.perso6_unlocked == 2 and My_struct.perso7_unlocked == 2)
			write(little2,160,16,4,"Nothing here");
		else
			write(little2,160,16,4,"Buy a character");
		end	
		write(little,160,32,4,My_struct.second_money+" Points");

		if (tmp > 8)
		
			// Manage navigation in the SHOP
				if (LEFT_PRESSED == 1)
					
					if (menu_choose > 0)
						play_wav(sound1,0,0);
						menu_choose = menu_choose - 1;
					end
					LEFT_PRESSED = 0;
					tmp = 0;
				elseif (RIGHT_PRESSED == 1)
					
					if (menu_choose < 6)
						play_wav(sound1,0,0);
						menu_choose = menu_choose + 1;
					end
					RIGHT_PRESSED = 0;
					tmp = 0;
				end
			
			// If user presses the BUY button
			if (B3_PRESSED)
					if (menu_choose == 0)
						if (My_struct.perso1_unlocked < 2 and My_struct.second_money > 999)
							play_wav(buy_sound,0,0);
							My_struct.perso1_unlocked = 2;
							My_struct.second_money = My_struct.second_money - 1000;
							Save("savebird",My_Struct); // Save the structure to a savefile
						end
					tmp = 0;
					elseif (menu_choose == 1)
						if (My_struct.perso2_unlocked < 2 and My_struct.second_money > 41)
							play_wav(buy_sound,0,0);
							My_struct.perso2_unlocked = 2;
							My_struct.second_money = My_struct.second_money - 42;
							Save("savebird",My_Struct); // Save the structure to a savefile
						end
					tmp = 0;
					elseif (menu_choose == 2)
						if (My_struct.perso3_unlocked < 2 and My_struct.second_money > 665)
							play_wav(buy_sound,0,0);
							My_struct.perso3_unlocked = 2;
							My_struct.second_money = My_struct.second_money - 666;
							Save("savebird",My_Struct); // Save the structure to a savefile
						end
					tmp = 0;
					elseif (menu_choose == 3)
						if (My_struct.perso4_unlocked < 2 and My_struct.second_money > 9000)
							play_wav(buy_sound,0,0);
							My_struct.perso4_unlocked = 2;
							My_struct.second_money = My_struct.second_money - 9001;
							Save("savebird",My_Struct); // Save the structure to a savefile
						end
					tmp = 0;
					elseif (menu_choose == 4)
						if (My_struct.perso5_unlocked < 2 and My_struct.second_money > 999)
							play_wav(buy_sound,0,0);
							My_struct.perso5_unlocked = 2;
							My_struct.second_money = My_struct.second_money - 1000;
							Save("savebird",My_Struct); // Save the structure to a savefile
						end
					tmp = 0;
					elseif (menu_choose == 5)
						if (My_struct.perso6_unlocked < 2 and (My_struct.second_money > 49 and My_struct.second_money < 201))
							play_wav(buy_sound,0,0);
							My_struct.perso6_unlocked = 2;
							My_struct.second_money = My_struct.second_money - My_struct.second_money;
							Save("savebird",My_Struct); // Save the structure to a savefile
						end
					tmp = 0;
					elseif (menu_choose == 6)
						if (My_struct.perso7_unlocked < 2 and (My_struct.second_money > 150))
							play_wav(buy_sound,0,0);
							My_struct.perso7_unlocked = 2;
							My_struct.second_money = My_struct.second_money - 151;
							Save("savebird",My_Struct); // Save the structure to a savefile
						end
					tmp = 0;
					end
				B3_PRESSED = 0;
			end

		end

			if (B4_PRESSED and tmp > 10)
					play_wav(sound1,0,0);
					menu();
			end
		
			if (tmp < 20)
				tmp++;
			end
		
		frame;
	end
	
	//guarda_opciones();
	
END






process choose_character()

local

	description_1="";
	description_2="";
	description_3="";
	description_4="";
	description_5="";
	description_6="";

	x_move = 0;
	delay = 0;
	
	character_x = 140;	
	character_y = 32;

begin

    clear_screen();
	let_me_alone();
	
	
	Controls();
	fond_titlescreen(4);
	
	tmp = 0;
	commencer = 0;
	hour = 0;
	min = 0;
	second = 0;
	micro = 0;
	frotter = 0;
	tap_time = 0;
	personnage_choosed = 0;
	swip = 0;
	cant = 2;
	
	littlebirdDEMOS(56,96,cant);
	back();


	loop
		
		Delete_text(ALL_TEXT);
		write(little3,120,170,4,"Choose your character");
		
			perso(140,32,bird_fpg,2,150);
			perso(188,32,bbird_fpg,2,150);
			perso(236,32,abird_fpg,2,50);
			perso(288,28,monkey_fpg,2,200);
			
			perso(140,80,tuc_fpg,My_struct.perso1_unlocked,150);
			perso(188,80,haku_fpg,My_struct.perso2_unlocked,150);
			perso(236,80,ouya_fpg,My_struct.perso3_unlocked,75);
			perso(284,80,fenix_fpg,My_struct.perso4_unlocked,50);
			
			perso(140,128,coin_fpg,My_struct.perso5_unlocked,75);
			perso(188,128,reimu_fpg,My_struct.perso6_unlocked,100);
			perso(236,128,kachoo_fpg,My_struct.perso7_unlocked,100);
			perso(284,132,dyna_fpg,2,85);
			
			perso(character_x-18,character_y+6,fpg1,2,85);
			
			if (character_y == 32)
				if (character_x == 140)
					cant = 2;
					personnage_choosed = 0;
				elseif (character_x == 140+(48*1))
					cant = 2;
					personnage_choosed = 1;
				elseif (character_x == 140+(48*2))
					cant = 2;
					personnage_choosed = 3;
				elseif (character_x == 140+(48*3))
					cant = 2;
					personnage_choosed = 4;
				end
			elseif (character_y == 80)
				if (character_x == 140)
				
					if (My_struct.perso1_unlocked < 2)
						cant = 1;
					else
						cant = 2;
					end
					
					personnage_choosed = 5;
				elseif (character_x == 140+(48*1))
				
					if (My_struct.perso2_unlocked < 2)
						cant = 1;
					else
						cant = 2;
					end
					
					personnage_choosed = 6;
				elseif (character_x == 140+(48*2))
				
					if (My_struct.perso3_unlocked < 2)
						cant = 1;
					else
						cant = 2;
					end
					
					personnage_choosed = 7;
				elseif (character_x == 140+(48*3))
				
					if (My_struct.perso4_unlocked < 2)
						cant = 1;
					else
						cant = 2;
					end
					
					personnage_choosed = 8;
				end
			elseif (character_y == 128)
				if (character_x == 140)
				
					if (My_struct.perso5_unlocked < 2)
						cant = 1;
					else
						cant = 2;
					end
					
					personnage_choosed = 9;
				elseif (character_x == 140+(48*1))
				
					if (My_struct.perso6_unlocked < 2)
						cant = 1;
					else
						cant = 2;
					end
					
					personnage_choosed = 10;
				elseif (character_x == 140+(48*2))
				
					if (My_struct.perso7_unlocked < 2)
						cant = 1;
					else
						cant = 2;
					end
					
					personnage_choosed = 11;
				elseif (character_x == 140+(48*3))
					cant = 2;
					personnage_choosed = 12;
				end
			end
		
			if (RIGHT_PRESSED == 1 and tmp > 9)
					if (character_x < 284)
						character_x = character_x + 48;
						tmp = 0;
						play_wav(sound1,0,0);
					end
			end
			
			if (LEFT_PRESSED == 1 and tmp > 9)
					if (character_x > 140)
						character_x = character_x - 48;
						tmp = 0;
						play_wav(sound1,0,0);
					end
			end
			
			if (DOWN_PRESSED == 1 and tmp > 9)
					if (character_y < 128)
						character_y = character_y + 48;
						tmp = 0;
						play_wav(sound1,0,0);
					end
			end
			
			if (UP_PRESSED == 1 and tmp > 9)
					if (character_y > 32)
						character_y = character_y - 48;
						tmp = 0;
						play_wav(sound1,0,0);
					end
			end
					
					if (ym > 244 and ym < 284)
							if (xm > 7 and xm < 56)
								play_wav(sound1,0,0);
								personnage_choosed = 12;
							elseif (xm > 55 and xm < 103)
								play_wav(sound1,0,0);
								personnage_choosed = 13;
							end
						
							if (xm > 199)
								play_wav(sound1,0,0);
								swip = 1;
							end
					end
		
			if (B4_PRESSED == 1 and tmp > 12)
					tmp = 0;
					play_wav(sound1,0,0);
					menu();
			end
			
			if (B3_PRESSED == 1 and tmp > 12 and cant == 2)
					play_wav(sound4,0,0);
					gameplay();
			end

		
		
			if (tmp < 30)
				tmp++;
			end
		
		frame;
	end
	
	//guarda_opciones();
	
END



process hand_control(x,y)
begin
	file = fpg1;
	graph = 2;
	z = 0;
	size = 100;
	

	loop
	
		x = choice_x;
		y = choice_y;
		
		frame;
	end
END




process hand()
begin
	file = fpg1;
	graph = 6;
	x = 60;
	y = 80;
	z = -4;
	size = 100;
	

	loop
	x = mmx;
	y = mmy;				

		frame;
	end
END

process abackground_fond()
begin

		if (fond_choosed == 0)
		file = baka_fpg;
		angle = 0;
		size = 1200;
		end
		
	graph = 1;
	x = 160;
	y = 90;
	z = 4;

	
	
	loop
	
		 graph = graph + 1;
		 
		 if (graph > 230)
			graph = 1;
		 end

			
		frame;
	end
END


process background_fond()
begin

		if (fond_choosed == 0)
		file = back1_fpg;
		angle = 0;
		size = 500;
		elseif (fond_choosed == 1)
		file = back2_fpg;
		angle = 0;
		size = 300;
		elseif (fond_choosed == 2)
		file = back3_fpg;
		angle = angle_touhou;
		size = size_touhou;
		elseif (fond_choosed == 3)
		file = back4_fpg;
		angle = angle_touhou;
		size = size_touhou;
		end
		
	graph = 1;
	x = 160;
	y = 90;
	z = 4;
	alpha = 255;

	
	
	loop
		frame_back = graph;
			if (fond_choosed == 2 || fond_choosed == 3)
			 angle = angle_touhou;
			 size = size_touhou;
			end
		
				alpha = alpha - 4;
				
					if (alpha < 1)
					
						if (fond_choosed == 0)
							if (graph > 4)
							graph = 1;
							else
							graph++;
							end
						elseif (fond_choosed == 1)
							if (graph > 2)
							graph = 1;
							else
							graph++;
							end
						elseif (fond_choosed == 2)
							if (graph > 2)
							graph = 1;
							else
							graph++;
							end
					
							if (mode_touhou == 0)
								size_touhou = size_touhou + 5;
							elseif (mode_touhou == 1)
								size_touhou = size_touhou - 5;
							end
							
							if (size_touhou > 298)
								mode_touhou = 1;
							elseif (size_touhou < 101)
								mode_touhou = 0;
							end
					
						elseif (fond_choosed == 3)
							if (graph > 3)
							graph = 1;
							else
							graph++;
							end
					
							if (mode_touhou == 0)
								size_touhou = size_touhou + 5;
							elseif (mode_touhou == 1)
								size_touhou = size_touhou - 5;
							end
							
							if (size_touhou > 399)
								mode_touhou = 1;
							elseif (size_touhou < 101)
								mode_touhou = 0;
							end
					
						end
						
						alpha = 255;
						
					end
			
		frame;
	end
END


process background_fond2()
begin

		if (fond_choosed == 0)
		file = back1_fpg;
		angle = 0;
		size = 500;
		elseif (fond_choosed == 1)
		file = back2_fpg;
		angle = 0;
		size = 300;
		elseif (fond_choosed == 2)
		file = back3_fpg;
		angle = angle_touhou;
		size = size_touhou;
		elseif (fond_choosed == 3)
		file = back4_fpg;
		angle = angle_touhou;
		size = size_touhou;
		end

	graph = frame_back+1;
	x = 160;
	y = 90;
	z = 5;
	
	
	loop
			if (fond_choosed == 2 || fond_choosed == 3)
			 angle = angle_touhou;
			 size = size_touhou;
			end

	
	
		if (fond_choosed == 0)
		
			if (frame_back > 4)
			graph = 1;
			else
			graph = frame_back+1;
			end
			
		elseif (fond_choosed == 1)
		
			if (frame_back > 2)
			graph = 1;
			else
			graph = frame_back+1;
			end
		
		elseif (fond_choosed == 2)
			angle_touhou = angle_touhou - 1000;
			
			if (frame_back > 2)
			graph = 1;
			else
			graph = frame_back+1;
			end
		
		elseif (fond_choosed == 3)
			angle_touhou = angle_touhou - 1500;
			
			if (frame_back > 3)
			graph = 1;
			else
			graph = frame_back+1;
			end
		
		end

		frame;
	end
END


process littlebird()
begin
	file = bird_fpg;
	graph = 2;
	x = 120;
	y = 180;
	z = 0;
	size = 700;
	
	loop
		if (commencer == 1)
		
		end
	
		if (wait_bird > 5) 
			graph++;
			if (graph > 5) 
			graph = 2;
			end
			wait_bird = 0;
		end

		wait_bird++;
	
		frame;
	end
END



process littlebirdDEMOS(x,y,graph)
begin
		if (personnage_choosed == 0)
			file = bird_fpg;
			size = 700/2;
		elseif (personnage_choosed == 1)
			file = bbird_fpg;
			size = 700/2;
		elseif (personnage_choosed == 2)
			file = twit_fpg;
			size = 350/2;	
		elseif (personnage_choosed == 3)
			file = abird_fpg;
			size = 200/2;	
		elseif (personnage_choosed == 4)
			file = monkey_fpg;
			size = 700/2;	
		elseif (personnage_choosed == 5)
			file = tuc_fpg;
			size = 700/2;	
		elseif (personnage_choosed == 6)
			file = haku_fpg;
			size = 700/2;	
		elseif (personnage_choosed == 7)
			file = ouya_fpg;
			size = 150;	
		elseif (personnage_choosed == 8)
			file = fenix_fpg;
			size = 300/2;	
		elseif (personnage_choosed == 9)
			file = coin_fpg;
			size = 400/2;	
		elseif (personnage_choosed == 10)
			file = reimu_fpg;
			size = 400/2;	
		elseif (personnage_choosed == 11)
			file = kachoo_fpg;
			size = 400/2;	
		elseif (personnage_choosed == 12)
			file = dyna_fpg;
			size = 400/2;	
		end
	
	
	z = 0;
	
	loop
	
		if (personnage_choosed == 0)
			file = bird_fpg;
			size = 700/2;
		elseif (personnage_choosed == 1)
			file = bbird_fpg;
			size = 700/2;
		elseif (personnage_choosed == 2)
			file = twit_fpg;
			size = 350/2;	
		elseif (personnage_choosed == 3)
			file = abird_fpg;
			size = 200/2;	
		elseif (personnage_choosed == 4)
			file = monkey_fpg;
			size = 700/2;	
		elseif (personnage_choosed == 5)
			file = tuc_fpg;
			size = 700/2;	
		elseif (personnage_choosed == 6)
			file = haku_fpg;
			size = 700/2;	
		elseif (personnage_choosed == 7)
			file = ouya_fpg;
			size = 150;	
		elseif (personnage_choosed == 8)
			file = fenix_fpg;
			size = 300/2;	
		elseif (personnage_choosed == 9)
			file = coin_fpg;
			size = 400/2;	
		elseif (personnage_choosed == 10)
			file = reimu_fpg;
			size = 400/2;	
		elseif (personnage_choosed == 11)
			file = kachoo_fpg;
			size = 400/2;	
		elseif (personnage_choosed == 12)
			file = dyna_fpg;
			size = 400/2;	
		end
	
	
	if (cant == 2)
		if (personnage_choosed == 10)	// If Reimu
			if (wait_bird > 3) 
				graph++;
				if (graph > 5) 
				graph = 3;
				end
				wait_bird = 0;
			end
		elseif (personnage_choosed == 12) // If Dyna
			if (wait_bird > 3) 
				graph++;
				if (graph > 7) 
				graph = 2;
				end
				wait_bird = 0;
			end	
		elseif (personnage_choosed == 11)	// If Kakachoo
			if (wait_bird > 3) 
				graph++;
				if (graph > 5) 
				graph = 3;
				end
				wait_bird = 0;
			end
		else
			if (wait_bird > 5) 
				graph++;
				if (graph > 5) 
				graph = 2;
				end
				wait_bird = 0;
			end
		end
	else
		graph = cant;
	end

		wait_bird++;
	
		frame;
	end
END






process littlebirdY(y)
begin
		if (personnage_choosed == 0)
			file = bird_fpg;
			size = 600;
		elseif (personnage_choosed == 1)
			file = bbird_fpg;
			size = 600;
		elseif (personnage_choosed == 2)
			file = twit_fpg;
			size = 300;	
		elseif (personnage_choosed == 3)
			file = abird_fpg;
			size = 200;	
		elseif (personnage_choosed == 4)
			file = monkey_fpg;
			size = 600;	
		elseif (personnage_choosed == 5)
			file = tuc_fpg;
			size = 600;	
		elseif (personnage_choosed == 6)
			file = haku_fpg;
			size = 600;	
		elseif (personnage_choosed == 7)
			file = ouya_fpg;
			size = 200;	
		elseif (personnage_choosed == 8)
			file = fenix_fpg;
			size = 200;	
		elseif (personnage_choosed == 9)
			file = coin_fpg;
			size = 300;	
		elseif (personnage_choosed == 10)
			file = reimu_fpg;
			size = 300;	
		elseif (personnage_choosed == 11)
			file = kachoo_fpg;
			size = 300;	
		elseif (personnage_choosed == 12)
			file = dyna_fpg;
			size = 300;	
		end
	
	graph = 2;
	x = 160;
	y = 100;
	z = 0;
	
	
	bird_y = 100;
	
	loop
		//y = bird_y;
		
		if (y < bird_y)
		y = y + 3;
		else
		y = bird_y;
		end
	
		if (personnage_choosed == 10)	// If Reimu
			if (wait_bird > 6) 
				graph++;
				if (graph > 5) 
				graph = 3;
				end
				wait_bird = 0;
			end
		elseif (personnage_choosed == 12) // If Dyna
			if (wait_bird > 6) 
				graph++;
				if (graph > 7) 
				graph = 2;
				end
				wait_bird = 0;
			end	
		elseif (personnage_choosed == 11)	// If Kakachoo
			if (wait_bird > 6) 
				graph++;
				if (graph > 5) 
				graph = 3;
				end
				wait_bird = 0;
			end
		else
			if (wait_bird > 5) 
				graph++;
				if (graph > 5) 
				graph = 2;
				end
				wait_bird = 0;
			end
		end
	

		wait_bird++;
	
		frame;
	end
END


process littlebirdP1(x,file)
local
wait_anim = 0;
begin
	graph = 2;
	size = 400;
	resolution = 1;
	z = 0;
	
	loop
		y = bird_y;
	
		if (wait_anim > 5) 
			graph++;
			if (graph > 5) 
			graph = 2;
			end
			wait_anim = 0;
		end

		wait_anim++;
	
		frame;
	end
END



process littlebirdP2(x,file)
local
wait_anim = 0;
begin
	graph = 2;
	size = 400;
	resolution = 1;
	z = 1;
	
	loop
		y = bird_y2;
	
		if (wait_anim > 5) 
			graph++;
			if (graph > 5) 
			graph = 2;
			end
			wait_anim = 0;
		end

		wait_anim++;
	
		frame;
	end
END


process littlebirdP2GO(x,file)
begin
	graph = 2;
	y = 180;
	z = 0;
	size = 400;
	
	loop

		if (size > 0)
		angle = angle + 4000;
		size = size - 20;
		end
	
		frame;
	end
END




process littlebirdGO()
begin
		if (personnage_choosed == 0)
			file = bird_fpg;
			size = 700;
		elseif (personnage_choosed == 1)
			file = bbird_fpg;
			size = 700;
		elseif (personnage_choosed == 2)
			file = twit_fpg;
			size = 350;	
		elseif (personnage_choosed == 3)
			file = abird_fpg;
			size = 200;	
		elseif (personnage_choosed == 4)
			file = monkey_fpg;
			size = 700;	
		elseif (personnage_choosed == 5)
			file = tuc_fpg;
			size = 700;	
		elseif (personnage_choosed == 6)
			file = haku_fpg;
			size = 700;	
		elseif (personnage_choosed == 7)
			file = ouya_fpg;
			size = 200;	
		elseif (personnage_choosed == 8)
			file = fenix_fpg;
			size = 300;	
		elseif (personnage_choosed == 9)
			file = coin_fpg;
			size = 400;	
		elseif (personnage_choosed == 10)
			file = reimu_fpg;
			size = 400;	
		elseif (personnage_choosed == 11)
			file = kachoo_fpg;
			size = 300;	
		elseif (personnage_choosed == 12)
			file = dyna_fpg;
			size = 400;	
		end
		
	graph = 2;
	x = 160;
	y = bird_y;
	z = 0;
	angle = 0;
	
	loop
		if (size > 0)
		angle = angle + 6000;
			if (personnage_choosed < 3)
			size = size - 30;
			elseif (personnage_choosed == 3)
			size = size - 7;
			elseif (personnage_choosed == 4)
			size = size - 25;
			else
			size = size - 20;
			end
			
		end
	
		frame;
	end
	
END

process twitter(x,y)
begin
	file = fpg1;
	graph = 1;
	z = -1;
	
	loop
		frame;
	end
END


process perso(x,y,file,graph,size)
begin
	z = -1;
	
	//loop
	
	
		frame;
	//end
END

process menu_swap(x,y,file,graph,size)
begin
	z = -1;
	
		frame;
END



process PROFILperso(x,y)
begin
	z = -1;
	
	loop
		file = fpg_choose;
		size = size_perso;
		
		if (personnage_choosed == 5 and My_struct.perso1_unlocked < 2)
			graph = 1;
		elseif (personnage_choosed == 6 and My_struct.perso2_unlocked < 2)
			graph = 1;
		elseif (personnage_choosed == 7 and My_struct.perso3_unlocked < 2)
			graph = 1;
		elseif (personnage_choosed == 8 and My_struct.perso4_unlocked < 2)
			graph = 1;
		elseif (personnage_choosed == 9 and My_struct.perso5_unlocked < 2)
			graph = 1;
		elseif (personnage_choosed == 10 and My_struct.perso6_unlocked < 2)
			graph = 1;
		elseif (personnage_choosed == 13 and My_struct.perso7_unlocked < 2)
			graph = 1;	
		else
			graph = 2;
		end
	
		frame;
	end
END



process back()
begin
	file = fpg1;
	graph = 7;
	x = 200-184;
	y = 320-16;
	z = 1;
	
	loop
		frame;
	end
END

process littlebird_titlescreen()
begin
	file = bird_fpg;
	graph = 2;
	x = 160;
	y = bird_y;
	z = 0;
	size = 500;
	
	loop
		y = bird_y;
		
		if (wait_bird > 5) 
			graph++;
			if (graph > 5) 
			graph = 2;
			end
			wait_bird = 0;
		end

		wait_bird++;
	
		frame;
	end
END



process fond_titlescreen(graph)
begin

	file = back1_fpg;
	angle = 0;

	size = 200;
	x = 160;
	y = 90;
	z = 5;
	
	
	loop

		frame;
	end
END
