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



process taptostart()
begin
	file = fpg1;
	graph = 11;
	x = 120;
	y = 272;
	z = 1;
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
	bird_y = 175;
	
	exitgame();
	Controls();
	fond_titlescreen(1);
	littlebird_titlescreen();
	taptostart();
	
	tmp = 0;
	commencer = 0;
	hour = 0;
	min = 0;
	second = 0;
	micro = 0;
	frotter = 0;
	
	tap_time = 0;
	tap_time2 = 0;
	
	loop
		
		Delete_text(ALL_TEXT);
		perso(30,307,fpg1,8,100);
		write(fnt,120,80,4,"RUBBY BIRD");
		
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
			bird_y = 175;
			tap_time2 = 0;
		end
		
		if (touch_state==1)
			if (tmp > 5)
				if (xm < 60 and ym > 265)
					EXIT(0,0);
				else
					div_song = load_song("2014_02_wip.ogg");
					if (My_struct.music_on == 1)
						play_song(div_song,-1);
					end
					menu();
				end
			end
		end
		
		if (tmp < 20)
		tmp++;
		end
		


		frame;
	end
	guarda_opciones();
END




process menu()
begin
    clear_screen();
	let_me_alone();
	
	exitgame();
	
	Controls();
	
	fond_titlescreen(1);
	
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
	
	// SHOP BUTTON
	menu_swap(180,160,fpg1,38,100);
		
	// PLAY BUTTON
	menu_swap(60,160,fpg1,37,100);
		
	menu_swap(60,240,fpg1,34,100);
	menu_swap(180,240,fpg1,36,100);
		
	loop
		
		Delete_text(ALL_TEXT);
		
		write(little2,32,95,0,"Highscore: ");
		write(little,144,95,0,+My_struct.highscore_h+":"+My_struct.highscore_m+":"+My_struct.highscore_s);

		
		if (touch_state==1)
			if (tmp > 5)
				if ((xm < 60 and ym > 265) || (scan_code==102 and os_id==1003))
					titlescreen();
				elseif (xm > 21 and xm < 212 and ym > 86 and ym < 114)
					tmp = 0;
					exec(_P_NOWAIT, "https://twitter.com/intent/tweet?text= Here's my Highscore on Rubby bird : "+My_struct.highscore_h+" hour(s) , "+My_struct.highscore_m+" minute(s) and "+My_struct.highscore_s+" second(s)."+" Can you beat me ? #rubbybird", 0, 0);
				elseif (xm > 24 and xm < 95 and ym > 124 and ym < 195)
					tmp = 0;
						if (My_struct.gfx_on == 1)
							play_wav(sound4,0,0);
						end
					menu_2();
				elseif (xm > 144 and xm < 215 and ym > 124 and ym < 195)
						if (My_struct.gfx_on == 1)
							play_wav(sound4,0,0);
						end
					shop();
				elseif (xm > 24 and xm < 95 and ym > 204 and ym < 275)
						if (My_struct.gfx_on == 1)
							play_wav(sound4,0,0);
						end
					about();
				elseif (xm > 144 and xm < 215 and ym > 204 and ym < 275)
						if (My_struct.gfx_on == 1)
							play_wav(sound4,0,0);
						end
					options();
				end
			end
		end
		
		if (tmp < 20)
		tmp++;
		end
		
		frame;
	end
	
	guarda_opciones();
END



process menu_2()
begin
    clear_screen();
	let_me_alone();
	
	exitgame();
	Controls();
	fond_titlescreen(1);
	
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

	menu_swap(70,180,fpg1,32,100);
	menu_swap(170,180,fpg1,33,100);
	
	loop
		
		Delete_text(ALL_TEXT);
		
		if (touch_state==1)
			if (tmp > 5)
				if ((xm < 60 and ym > 265) || (scan_code==102 and os_id==1003))
					menu();
				elseif (xm > 35 and xm < 105 and ym > 144 and ym < 215)
					tmp = 0;
						if (My_struct.gfx_on == 1)
							play_wav(sound4,0,0);
						end
					choose_character();
				elseif (xm > 134 and xm < 205 and ym > 144 and ym < 215)
						if (My_struct.gfx_on == 1)
							play_wav(sound4,0,0);
						end
					gameplayP2();
				end
			end
		end
		
		if (tmp < 20)
		tmp++;
		end
		
		frame;
	end
	
	guarda_opciones();
END





process options()
local
credit_y = 300;
time = 0;
begin
    clear_screen();
	let_me_alone();
	
	fond_titlescreen(1);
	
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
		
		write(fnt,16,80,0,"OPTIONS");
		write(fnt,16,160,0,"MUSIC :");
		write(fnt,16,220,0,"GFX   :");
		
		if (My_struct.music_on == 1)
			write(fnt,160,160,0,"ON");
		elseif (My_struct.music_on == 0)
			write(fnt,160,160,0,"OFF");
		end
		
		if (My_struct.gfx_on == 1)
			write(fnt,160,220,0,"ON");
		elseif (My_struct.gfx_on == 0)
			write(fnt,160,220,0,"OFF");
		end
		
		if (touch_state==1)
			if (tmp > 5)
				if ((xm < 60 and ym > 265) || (scan_code==102 and os_id==1003))
					Save("savebird",My_Struct);
					menu();
				end
				
				if ( (xm > 150 and xm < 203 and ym > 140 and ym < 190) )
					if (My_struct.music_on == 1)
						My_struct.music_on = 0;
					elseif (My_struct.music_on == 0)
						My_struct.music_on = 1;
					end
					tmp = 0;
				end
				
				if ( (xm > 150 and xm < 203 and ym > 210 and ym < 270) )
					if (My_struct.gfx_on == 1)
						My_struct.gfx_on = 0;
					elseif (My_struct.gfx_on == 0)
						My_struct.gfx_on = 1;
					end
					tmp = 0;
				end
				
			end
		end
		if (tmp < 20)
			tmp++;
		end
		
		frame;
	end
	guarda_opciones();
END







process about()
local
credit_y = 300;
time = 0;
begin
    clear_screen();
	let_me_alone();
	
	fond_titlescreen(1);
	
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
		if (time > 0)
			credit_y = credit_y - 1;
			time = 0;
		end
		
		write(fnt,16,credit_y-16,0,"CREDITS");
		write(little,16,credit_y+24,0,"GRAPHICS, PROGRAMMING");
		write(little2,16,credit_y+(24*2),0,"GAMEBLABLA");
		
		write(little,16,credit_y+(24*4),0,"MUSIC/SFX (w/ changes)");
		write(little,16,credit_y+(24*5),0,"Gameblabla");
		write(little,16,credit_y+(24*6),0,"LUIS LOPEZ MARTINEZ");
		write(little,16,credit_y+(24*8),0,"BoxCat Games");
		write(little,16,credit_y+(24*9),0,"tinyurl.com/2v352h");
		write(little,16,credit_y+(24*10),0,"Jesus Latra");
		write(little,16,credit_y+(24*11),0,"tinyurl.com/yqontc");
		
		write(little2,16,credit_y+(24*13),0,"FONTS");
		write(little,16,credit_y+(24*14),0,"CodeMan83");	
		
		
		if (touch_state==1)
			if (tmp > 5)
				if ((xm < 60 and ym > 265) || (scan_code==102 and os_id==1003))
					if (My_struct.gfx_on == 1)
						play_wav(sound1,0,0);
					end
					menu();
				end
			end
		end
		
		if (credit_y < -450)
			menu();
		end
		
		if (tmp < 20)
			tmp++;
		end
		
		frame;
	end
	guarda_opciones();
END

process shop()
local
menu_choose = 0; 
begin
    clear_screen();
	let_me_alone();
	
	exitgame();
	Controls();
	fond_titlescreen(1);
	photo();
	
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
			//perso(20,256,fpg1,4,133); //<--
			perso(40,256-16,fpg1,39,100);
		end
		
		if (menu_choose < 8)
			//perso(220,256,fpg1,3,133); //-->
			perso(200,256-16,fpg1,40,100);
		end
		
		if (menu_choose == 0)
		
			perso(120,170,tuc_fpg,My_struct.perso1_unlocked,600); // TUC
			
				if (My_struct.perso1_unlocked < 2)
					write(little2,120,305-8,4,"1000");
					perso(120,256-16,fpg1,35,100); // BUY
				elseif (My_struct.perso1_unlocked == 2)
					write(fnt3,120,256-8,4,"TUC");
				end
				
		elseif (menu_choose == 1)
			perso(120,165,haku_fpg,My_struct.perso2_unlocked,500); // HAKU
			
				if (My_struct.perso2_unlocked < 2)
					write(little2,120,305-8,4,"42");
					perso(120,256-16,fpg1,35,100); // BUY
				elseif (My_struct.perso2_unlocked == 2)
					write(fnt3,120,256-8,4,"HAKU");
				end
				
		elseif (menu_choose == 2)
			perso(120,170,ouya_fpg,My_struct.perso3_unlocked,75); // BUYA
			
				if (My_struct.perso3_unlocked < 2)
					write(little2,120,305-8,4,"666");
					perso(120,256-16,fpg1,35,100); // BUY
				elseif (My_struct.perso3_unlocked == 2)
					write(fnt3,120,256-8,4,"BUYA");
				end
				
		elseif (menu_choose == 3)
			perso(120,165,fenix_fpg,My_struct.perso4_unlocked,200); // FENIX
			
				if (My_struct.perso4_unlocked < 2)
					write(little2,120,305-8,4,"9001");
					perso(120,256-16,fpg1,35,100); // BUY
				elseif (My_struct.perso4_unlocked == 2)
					write(fnt3,120,256-8,4,"FENIX");
				end
			
		elseif (menu_choose == 4)
			perso(120,165,coin_fpg,My_struct.perso5_unlocked,300); // COINYE
			
				if (My_struct.perso5_unlocked < 2)
					write(little2,120,305-8,4,"4444");
					perso(120,256-16,fpg1,35,100); // BUY
				elseif (My_struct.perso5_unlocked == 2)
					write(fnt3,120,256-8,4,"COINYE");
				end
			
		elseif (menu_choose == 5)
			perso(120,165,ramu_fpg,My_struct.perso6_unlocked,300); // REIMU
			
				if (My_struct.perso6_unlocked < 2)
					write(little2,120,305-8,4,">50 and <200");
					perso(120,256-16,fpg1,35,100); // BUY
				elseif (My_struct.perso6_unlocked == 2)
					write(fnt3,120,256-8,4,"RAMU");
				end
			
		elseif (menu_choose == 6)
			perso(120,165,kachoo_fpg,My_struct.perso7_unlocked,300); // KAKACHOO
			
				if (My_struct.perso7_unlocked < 2)
					write(little2,120,305-8,4,"151");
					perso(120,256-16,fpg1,35,100); // BUY
				elseif (My_struct.perso7_unlocked == 2)
					write(fnt3,120,256-8,4,"KAKACHOO");
				end
				
		elseif (menu_choose == 7)
			perso(120,165,lila_fpg,My_struct.perso8_unlocked,400); // LILA
			
				if (My_struct.perso8_unlocked < 2)
					write(little2,120,305-8,4,"34");
					perso(120,256-16,fpg1,35,100); // BUY
				elseif (My_struct.perso8_unlocked == 2)
					write(fnt3,120,256-8,4,"LILA");
				end
				
		elseif (menu_choose == 8)
			perso(120,165,bbird_fpg,2,400); // FINAL BOSS
			
				if (My_struct.boss_final < 2)
					write(little2,120,305-8,4,"1 Point");
					perso(120,256-16,fpg1,35,100); // BUY
				elseif (My_struct.boss_final == 2)
					write(little2,120,305-8,4,"BOSS BATTLE");
					perso(120,256-16,fpg1,37,100); // BUY
				end
				
		end
		

		//write(little2,120,65,4,"Buy characters");
		write(little,120,80,4,My_struct.second_money+" Pts");

		if (touch_state==1 and tmp > 4)
		
			// Manage navigation in the SHOP
			if (ym > 16 and ym < 290)
				if (xm < 65)
					if (menu_choose > 0)
						if (My_struct.gfx_on == 1)
							play_wav(sound1,0,0);
						end
						menu_choose = menu_choose - 1;
					end
					tmp = 0;
				elseif (xm > 175)
					if (menu_choose < 8)
						if (My_struct.gfx_on == 1)
							play_wav(sound1,0,0);
						end
						menu_choose = menu_choose + 1;
					end
					tmp = 0;
				end
			end
			
			if ((xm < 84 and ym > 279-16 and ym < 322-16) || (scan_code==102 and os_id==1003))
					if (My_struct.gfx_on == 1)
						play_wav(sound1,0,0);
					end
					menu();
			end
			
			if ((ym > 220-16 and ym < 296-16 and xm > 80 and xm < 156) and (menu_choose == 8 and My_struct.boss_final == 2 and touch_state == 1))
					if (My_struct.gfx_on == 1)
						play_wav(sound1,0,0);
					end
					fade (5 , 5, 5 , 16 ) ;
					intro_finalboss();
			end

			
			// If user presses the BUY button
			if (ym > 220-16 and ym < 296-16 and xm > 83 and xm < 156)
					if (menu_choose == 0)
						if (My_struct.perso1_unlocked < 2 and My_struct.second_money > 999)
							if (My_struct.gfx_on == 1)
								play_wav(buy_sound,0,0);
							end
							My_struct.perso1_unlocked = 2;
							My_struct.second_money = My_struct.second_money - 1000;
							Save("savebird",My_Struct); // Save the structure to a savefile
						end
					tmp = 0;
					elseif (menu_choose == 1)
						if (My_struct.perso2_unlocked < 2 and My_struct.second_money > 41)
							if (My_struct.gfx_on == 1)
								play_wav(buy_sound,0,0);
							end
							My_struct.perso2_unlocked = 2;
							My_struct.second_money = My_struct.second_money - 42;
							Save("savebird",My_Struct); // Save the structure to a savefile
						end
					tmp = 0;
					elseif (menu_choose == 2)
						if (My_struct.perso3_unlocked < 2 and My_struct.second_money > 665)
							if (My_struct.gfx_on == 1)
								play_wav(buy_sound,0,0);
							end
							My_struct.perso3_unlocked = 2;
							My_struct.second_money = My_struct.second_money - 666;
							Save("savebird",My_Struct); // Save the structure to a savefile
						end
					tmp = 0;
					elseif (menu_choose == 3)
						if (My_struct.perso4_unlocked < 2 and My_struct.second_money > 9000)
							if (My_struct.gfx_on == 1)
								play_wav(buy_sound,0,0);
							end
							My_struct.perso4_unlocked = 2;
							My_struct.second_money = My_struct.second_money - 9001;
							Save("savebird",My_Struct); // Save the structure to a savefile
						end
					tmp = 0;
					elseif (menu_choose == 4)
						if (My_struct.perso5_unlocked < 2 and My_struct.second_money > 999)
							if (My_struct.gfx_on == 1)
								play_wav(buy_sound,0,0);
							end
							My_struct.perso5_unlocked = 2;
							My_struct.second_money = My_struct.second_money - 1000;
							Save("savebird",My_Struct); // Save the structure to a savefile
						end
					tmp = 0;
					elseif (menu_choose == 5)
						if (My_struct.perso6_unlocked < 2 and (My_struct.second_money > 49 and My_struct.second_money < 201))
							if (My_struct.gfx_on == 1)
								play_wav(buy_sound,0,0);
							end
							My_struct.perso6_unlocked = 2;
							My_struct.second_money = My_struct.second_money - My_struct.second_money;
							Save("savebird",My_Struct); // Save the structure to a savefile
						end
					tmp = 0;
					elseif (menu_choose == 6)
						if (My_struct.perso7_unlocked < 2 and (My_struct.second_money > 150))
							if (My_struct.gfx_on == 1)
								play_wav(buy_sound,0,0);
							end
							My_struct.perso7_unlocked = 2;
							My_struct.second_money = My_struct.second_money - 151;
							Save("savebird",My_Struct); // Save the structure to a savefile
						end
					tmp = 0;
					elseif (menu_choose == 7)
						if (My_struct.perso8_unlocked < 2 and (My_struct.second_money > 33))
							if (My_struct.gfx_on == 1)
								play_wav(buy_sound,0,0);
							end
							My_struct.perso8_unlocked = 2;
							My_struct.second_money = My_struct.second_money - 34;
							Save("savebird",My_Struct); // Save the structure to a savefile
						end
					tmp = 0;
					elseif (menu_choose == 8)
						if (My_struct.boss_final < 2 and (My_struct.second_money > 0))
							if (My_struct.gfx_on == 1)
								play_wav(buy_sound,0,0);
							end
							My_struct.boss_final = 2;
							My_struct.second_money = My_struct.second_money - 1;
							Save("savebird",My_Struct); // Save the structure to a savefile
						end
					tmp = 0;
					end
			end
				

		end

		
		if (tmp < 20)
		tmp++;
		end
		
		frame;
	end
	guarda_opciones();
END






process choose_character()
local
description_1="";
description_2="";
description_3="";
description_4="";
description_5="";
description_6="";
cant = 0;

x_move = 0;
delay = 0;


begin

    clear_screen();
	let_me_alone();
	photo();
	
	exitgame();
	Controls();
	fond_titlescreen(1);
	
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
	cant = 0;
	
	PROFILperso(60,100);
	back();


	loop
		
		Delete_text(ALL_TEXT);
		//write(little3,120,170,4,"Choose your character");
		
		if (swip == 0)
			perso(32,210-8,bird_fpg,2,200);
			perso(80,210-8,bbird_fpg,2,200);
			perso(128,210-8,twit_fpg,2,100);
			perso(176,210-8,abird_fpg,2,50);
			perso(32,254-8,monkey_fpg,2,200);
			perso(80,258-8,tuc_fpg,My_struct.perso1_unlocked,200);
			perso(128,253-8,haku_fpg,My_struct.perso2_unlocked,200);
			perso(176,260-8,ouya_fpg,My_struct.perso3_unlocked,25);
			perso(218,254-8,fpg1,3,100);
		elseif (swip == 1)
			perso(32,210-8,fenix_fpg,My_struct.perso4_unlocked,50);
			perso(80,210-8,coin_fpg,My_struct.perso5_unlocked,75);
			perso(128,210-8,ramu_fpg,My_struct.perso6_unlocked,100);
			perso(176,210-8,void_fpg,10,100);
			
			perso(32,254-8,dyna_fpg,2,100);
			perso(80,253-8,kachoo_fpg,My_struct.perso7_unlocked,100);
			perso(128,258-8,lila_fpg,My_struct.perso8_unlocked,100);
			
			perso(218,210-8,fpg1,4,100);
		end
		
		
		write(petite_fnt,100,62,0,description_1);
		write(petite_fnt,100,75,0,description_2);
		write(petite_fnt,100,88,0,description_3);
		write(petite_fnt,100,101,0,description_4);
		write(petite_fnt,100,114,0,description_5);
		write(petite_fnt,100,127,0,description_6);
		
		if (cant == 0)
			write(fnt,160,296,0,"PLAY");
		end

	
		if (swip == 0)	
				if (personnage_choosed == 0)
					size_perso = 400;
					fpg_choose = bird_fpg;
					cant = 0;
						description_1 = "";		
						description_2 = "";		
						description_3 = "";	
						description_4 = "";	
						description_5 = "";	
						description_6 = "";	
				elseif (personnage_choosed == 1)
					size_perso = 400;
					fpg_choose = bbird_fpg;
					cant = 0;
						description_1 = "Original the";		
						description_2 = "character";	
						description_3 = "";				
						description_4 = "DO NOT STEAL";	
						description_5 = "";	
						description_6 = "";	
				elseif (personnage_choosed == 2)
					size_perso = 200;
					fpg_choose = twit_fpg;
					cant = 0;
						description_1 = " Hi, i just";		
						description_2 = " want to tell";		
						description_3 = " you that...";	
						description_4 = " ";	
						description_5 = "Ugh, Tweets are";	
						description_6 = "way too short!";	
				elseif (personnage_choosed == 3)
					size_perso = 100;
					fpg_choose = abird_fpg;
					cant = 0;
						description_1 = " HUNGRY BEURDS!";		
						description_2 = "";		
						description_3 = "";	
						description_4 = "";	
						description_5 = " ";	
						description_6 = " ";	
				elseif (personnage_choosed == 4)
					size_perso = 400;
					fpg_choose = monkey_fpg;
					cant = 0;
						description_1 = " Monkeys get";		
						description_2 = " no love :(";	
						description_3 = "";				
						description_4 = " SCREW YOU";	
						description_5 = " DARWIN";	
						description_6 = "";	
				elseif (personnage_choosed == 5)
				size_perso = 400;
				fpg_choose = tuc_fpg;
						if (My_struct.perso1_unlocked == 2)
							cant = 0;
							description_1 = "This duck will";		
							description_2 = "do anything for";		
							description_3 = "his freedom !";	
							description_4 = "RIP GTA,";	
							description_5 = "Australia";	
							description_6 = "killed you";	
						else
							cant = 1;
							description_1 = "BUY HIM IN";		
							description_2 = "THE SHOP !";		
							description_3 = "";	
							description_4 = "";	
							description_5 = "";	
							description_6 = "";	
						end
				elseif (personnage_choosed == 6)
					size_perso = 400;
					fpg_choose = haku_fpg;
						if (My_struct.perso2_unlocked == 2)
						cant = 0;
						description_1 = "She's just a";		
						description_2 = "japanese girl.";		
						description_3 = "";	
						description_4 = "You know, with";	
						description_5 = "gray hairs like";	
						description_6 = "old people.";	
						else
						cant = 1;
						description_1 = "BUY HER IN";		
						description_2 = "THE SHOP !";		
						description_3 = "";	
						description_4 = "";
						description_5 = "";
						description_6 = "";
						end
				elseif (personnage_choosed == 7)
					size_perso = 50;
					fpg_choose = ouya_fpg;
						if (My_struct.perso3_unlocked == 2)
						cant = 0;
						description_1 = " BOUYAH !";		
						description_2 = "";		
						description_3 = "";	
						description_4 = " WHAT A GREAT";	
						description_5 = " CONSOLE FOR";	
						description_6 = " INDIES";	
						else
						cant = 1;
						description_1 = " BUY IT IN";		
						description_2 = " THE SHOP !";		
						description_3 = "";	
						description_4 = "";
						description_5 = "";
						description_6 = "";
						end
				end
				
				if (touch_state==1 and tmp > 4)
					if (ym > 185-8 and ym < 235-8)
						if (xm > 7 and xm < 56)
							if (My_struct.gfx_on == 1)
								play_wav(sound1,0,0);
							end
							personnage_choosed = 0;
						elseif (xm > 55 and xm < 103)
							if (My_struct.gfx_on == 1)
								play_wav(sound1,0,0);
							end
							personnage_choosed = 1;
						elseif (xm > 102 and xm < 150)
							if (My_struct.gfx_on == 1)
								play_wav(sound1,0,0);
							end
							personnage_choosed = 2;
						elseif (xm > 153 and xm < 202)
							if (My_struct.gfx_on == 1)
								play_wav(sound1,0,0);
							end
							personnage_choosed = 3;
						end
						
					end
					
					if (ym > 244-8 and ym < 284-8)
						if (xm > 7 and xm < 56)
							if (My_struct.gfx_on == 1)
								play_wav(sound1,0,0);
							end
							personnage_choosed = 4;
						elseif (xm > 55 and xm < 103)
							if (My_struct.gfx_on == 1)
								play_wav(sound1,0,0);
							end
							personnage_choosed = 5;
						elseif (xm > 102 and xm < 150)
							if (My_struct.gfx_on == 1)
								play_wav(sound1,0,0);
							end
							personnage_choosed = 6;
						elseif (xm > 153 and xm < 202)
							if (My_struct.gfx_on == 1)
								play_wav(sound1,0,0);
							end
							personnage_choosed = 7;
						end
						
						if (xm > 199)
							if (My_struct.gfx_on == 1)
								play_wav(sound1,0,0);
							end
							swip = 1;
						end
						
					end
					
					if (xm < 83 and ym > 279 and ym < 322)
							if (My_struct.gfx_on == 1)
								play_wav(sound1,0,0);
							end
							menu();
					elseif ((xm > 150 and ym > 279 and ym < 322) and cant == 0)
							if (My_struct.gfx_on == 1)
								play_wav(sound4,0,0);
							end
							gameplay();
					end
						tmp = 0;
				end
				
		elseif (swip == 1)
		
				if (personnage_choosed == 8)
					size_perso = 150;
					fpg_choose = fenix_fpg;
						if (My_struct.perso4_unlocked == 2)
						cant = 0;
						description_1 = " The fenix ";		
						description_2 = " never dies !";		
						description_3 = "";	
						description_4 = " (Rubby Bid was";	
						description_5 = " programmed in";	
						description_6 = " Fenix)";	
						else
						cant = 1;
						description_1 = " BUY IT IN";		
						description_2 = " THE SHOP !";		
						description_3 = "";	
						description_4 = "";
						description_5 = "";
						description_6 = "";
						end
				elseif (personnage_choosed == 9)
					size_perso = 200;
					fpg_choose = coin_fpg;
						if (My_struct.perso5_unlocked == 2)
						cant = 0;
						description_1 = "   'YOU SHALL";		
						description_2 = "   NOT OPPOSE";		
						description_3 = "   THE GREAT";	
						description_4 = "   AND MIGHTY";	
						description_5 = "   COINYE !'";	
						description_6 = "    ";	
						
						else
						cant = 1;
						description_1 = "  BUY HIM IN";		
						description_2 = "  THE SHOP !";		
						description_3 = "";	
						description_4 = "";
						description_5 = "";
						description_6 = "";
						end
				elseif (personnage_choosed == 10)
					size_perso = 200;
					fpg_choose = ramu_fpg;
						if (My_struct.perso6_unlocked == 2)
						cant = 0;
						description_1 = "   Tohofags ";		
						description_2 = "   are going  ";		
						description_3 = "   to be happy";	
						description_4 = "   when they'll";	
						description_5 = "   see this ! ";	
						description_6 = "    ";	
						
						else
						cant = 1;
						description_1 = "  BUY HER IN";		
						description_2 = "  THE SHOP !";		
						description_3 = "";	
						description_4 = "";
						description_5 = "";
						description_6 = "";
						end
				elseif (personnage_choosed == 11)
					size_perso = 200;
					fpg_choose = void_fpg;
					cant = 0;
					description_1 = "Rub nothing  ";		
					description_2 = "but the air !";		
					description_3 = "  ";	
					description_4 = "   ";	
					description_5 = "i no, rit";	
					description_6 = "";	
				elseif (personnage_choosed == 12)
					size_perso = 200;
					fpg_choose = dyna_fpg;
					cant = 0;
					description_1 = "  Boom goes";		
					description_2 = "  the dynamite!";		
					description_3 = "  Rub Dyna ";	
					description_4 = "  before she";	
					description_5 = "  explodes !";	
					description_6 = "";	
				elseif (personnage_choosed == 13)
					size_perso = 200;
					fpg_choose = kachoo_fpg;
						if (My_struct.perso7_unlocked == 2)
						cant = 0;
						description_1 = "KAAAAA...";		
						description_2 = "KAAAAAAAA...";		
						description_3 = "CHOOOOOOOOO !";	
						description_4 = "";	
						description_5 = "";	
						description_6 = "";	
						else
						cant = 1;
						description_1 = " BUY IT IN";		
						description_2 = " THE SHOP !";		
						description_3 = "";	
						description_4 = "";
						description_5 = "";
						description_6 = "";
						end
				elseif (personnage_choosed == 14)
					size_perso = 300;
					fpg_choose = lila_fpg;
						if (My_struct.perso8_unlocked == 2)
						cant = 0;
						description_1 = "   Hey, look !";		
						description_2 = "   Its a sonic";		
						description_3 = "   clone but";	
						description_4 = "   with female";	
						description_5 = "   characters.";	
						description_6 = "   LAME !";	
						else
						cant = 1;
						description_1 = " BUY HER IN";		
						description_2 = " THE SHOP !";		
						description_3 = "";	
						description_4 = "";
						description_5 = "";
						description_6 = "";
						end
				end
				
				
				if (touch_state==1 and tmp > 4)
					if (ym > 185-8 and ym < 235-8)
							if (xm > 7 and xm < 56)
								if (My_struct.gfx_on == 1)
									play_wav(sound1,0,0);
								end
								personnage_choosed = 8;
							elseif (xm > 55 and xm < 103)
								if (My_struct.gfx_on == 1)
									play_wav(sound1,0,0);
								end
								personnage_choosed = 9;
							elseif (xm > 102 and xm < 150)
								if (My_struct.gfx_on == 1)
									play_wav(sound1,0,0);
								end
								personnage_choosed = 10;
							elseif (xm > 153 and xm < 202)
								if (My_struct.gfx_on == 1)
									play_wav(sound1,0,0);
								end
								personnage_choosed = 11;
							end
						
							
							if (xm > 199)
								if (My_struct.gfx_on == 1)
									play_wav(sound1,0,0);
								end
								swip = 0;
							end
					end
					
					if (ym > 244-8 and ym < 284-8)
					
							if (xm > 7 and xm < 56)
								if (My_struct.gfx_on == 1)
									play_wav(sound1,0,0);
								end
								personnage_choosed = 12;
							elseif (xm > 55 and xm < 103)
								if (My_struct.gfx_on == 1)
									play_wav(sound1,0,0);
								end
								personnage_choosed = 13;
							elseif (xm > 102 and xm < 150)
								if (My_struct.gfx_on == 1)
									play_wav(sound1,0,0);
								end
								personnage_choosed = 14;
							end
						
						if (xm > 199)
							if (My_struct.gfx_on == 1)
								play_wav(sound1,0,0);
							end
							swip = 1;
						end
						
					end
					
					if ((xm < 60 and ym > 265) || (scan_code==102 and os_id==1003))
							if (My_struct.gfx_on == 1)
								play_wav(sound1,0,0);
							end
							menu();
					elseif ((xm > 150 and ym > 279 and ym < 322) and cant == 0)
							if (My_struct.gfx_on == 1)
								play_wav(sound4,0,0);
							end
							gameplay();
					end
						tmp = 0;
				end

				
		end
		
		

		
		if (tmp < 20)
		tmp++;
		end
		
		frame;
	end
END





process hand()
begin
	file = fpg1;
	graph = 6;
	x = 60;
	y = 80;
	z = -6;
	size = 50;
	alpha = 255;
	

	loop
	x = mouse.x;
	y = mouse.y;				
				
		frame;
	end
END

process abackground_fond()
begin

		if (fond_choosed == 0)
		file = baka_fpg;
		angle = 0;
		size = 900;
		end
		
	graph = 1;
	x = 120;
	y = 160;
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
		size = 100;
		elseif (fond_choosed == 2)
		file = back3_fpg;
		angle = angle_ramu;
		size = size_ramu;
		elseif (fond_choosed == 3)
		file = back4_fpg;
		angle = angle_ramu;
		size = size_ramu;
		end
		
	graph = 1;
	x = 120;
	y = 160;
	z = 4;
	alpha = 255;

	
	
	loop
		frame_back = graph;
			if (fond_choosed == 2 || fond_choosed == 3)
			 angle = angle_ramu;
			 size = size_ramu;
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
					
							if (mode_ramu == 0)
								size_ramu = size_ramu + 5;
							elseif (mode_ramu == 1)
								size_ramu = size_ramu - 5;
							end
							
							if (size_ramu > 298)
								mode_ramu = 1;
							elseif (size_ramu < 101)
								mode_ramu = 0;
							end
					
						elseif (fond_choosed == 3)
							if (graph > 3)
							graph = 1;
							else
							graph++;
							end
					
							if (mode_ramu == 0)
								size_ramu = size_ramu + 5;
							elseif (mode_ramu == 1)
								size_ramu = size_ramu - 5;
							end
							
							if (size_ramu > 399)
								mode_ramu = 1;
							elseif (size_ramu < 101)
								mode_ramu = 0;
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
		size = 100;
		elseif (fond_choosed == 2)
		file = back3_fpg;
		angle = angle_ramu;
		size = size_ramu;
		elseif (fond_choosed == 3)
		file = back4_fpg;
		angle = angle_ramu;
		size = size_ramu;
		end

	graph = frame_back+1;
	x = 120;
	y = 160;
	z = 5;
	
	
	loop
			if (fond_choosed == 2 || fond_choosed == 3)
			 angle = angle_ramu;
			 size = size_ramu;
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
			angle_ramu = angle_ramu - 1000;
			
			if (frame_back > 2)
			graph = 1;
			else
			graph = frame_back+1;
			end
		
		elseif (fond_choosed == 3)
			angle_ramu = angle_ramu - 1500;
			
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



process littlebirdY(y)
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
			size = 100;	
		elseif (personnage_choosed == 8)
			file = fenix_fpg;
			size = 300;	
		elseif (personnage_choosed == 9)
			file = coin_fpg;
			size = 400;	
		elseif (personnage_choosed == 10)
			file = ramu_fpg;
			size = 400;	
		elseif (personnage_choosed == 11)
			file = void_fpg;
			size = 400;	
		elseif (personnage_choosed == 12)
			file = dyna_fpg;
			size = 400;	
		elseif (personnage_choosed == 13)
			file = kachoo_fpg;
			size = 300;	
		elseif (personnage_choosed == 14)
			file = lila_fpg;
			size = 600;	
		end
	
	graph = 2;
	x = 120;
	y = 180;
	z = 0;
	
	
	bird_y = 200;
	
	loop
		//y = bird_y;
		
		if (y < bird_y)
		y = y + 3;
		else
		y = bird_y;
		end
	
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
		elseif (personnage_choosed == 13)	// If Kakachoo
			if (wait_bird > 3) 
				graph++;
				if (graph > 5) 
				graph = 3;
				end
				wait_bird = 0;
			end
		elseif (personnage_choosed == 14)	// If Lila
			if (wait_bird > 3) 
				graph++;
				if (graph > 5) 
				graph = 2;
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



process littlebirdP2(x,file,size)
local
wait_anim = 0;
begin
	graph = 2;
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
			size = 100;	
		elseif (personnage_choosed == 8)
			file = fenix_fpg;
			size = 300;	
		elseif (personnage_choosed == 9)
			file = coin_fpg;
			size = 400;	
		elseif (personnage_choosed == 10)
			file = ramu_fpg;
			size = 400;	
		elseif (personnage_choosed == 11)
			file = void_fpg;
			size = 400;	
		elseif (personnage_choosed == 12)
			file = dyna_fpg;
			size = 400;	
		elseif (personnage_choosed == 13)
			file = kachoo_fpg;
			size = 300;	
		elseif (personnage_choosed == 14)
			file = lila_fpg;
			size = 600;	
		end
		
	graph = 2;
	x = 120;
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
local
idd;
begin
	z = -5;
	alpha = 0;
	
	loop
	
		if (alpha < 255)
		alpha += 33;
		end
		
		frame;
	end
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
		elseif (personnage_choosed == 14 and My_struct.perso8_unlocked < 2)
			graph = 1;	
		else
			graph = 2;
		end
	
		frame;
	end
END


process theexit()
begin
	file = fpg1;
	graph = 20;
	x = 200-184;
	y = 320-16;
	z = 1;
	
	loop
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

process photo()
begin
	loop
		frame;
	end
END

process littlebird_titlescreen()
local
aa=0;
begin
	rand_seed(1);
	aa=rand(0,4);
	file = bird_fpg;
	size = 700;
	graph = 2;
	x = 120;
	y = bird_y;
	z = 0;
	
	
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

	size = 100;
	x = 120;
	y = 160;
	z = 5;
	
	
	loop

		frame;
	end
END
