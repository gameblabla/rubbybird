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


process intro_finalboss()
local
caca_x = 400;
begin
	Delete_text(ALL_TEXT);
    clear_screen();
	let_me_alone();
	stop_song();
	
	fade (100 , 100 , 100 , 16 ) ;	
	for(i=0;i<15;i++)
		frame;
	end
		
	exitgame();
	Controls();
	
	abackground_fond();
		
	bird_y = 200;
	bird_y2 = 200;
		
	littlebirdP1(60,bird_fpg);
	littlebirdP2(180,bird_gauche_fpg,400);
	
	for(i=0;i<160;i++)
		controls();
		Delete_text(ALL_TEXT);
		write(little2,60,70,0,"MOUAHAHA !");
		write(little2,60,90,0,"YOU THINK");
		write(little2,60,110,0,"YOU CAN BEAT ME?");
		write(little2,120,300,4,"PRESS TO SKIP");
		if (touch_state > 0) 
		gameplay_finalboss();
		end
		frame;
	end
	
	for(i=0;i<150;i++)
		controls();
		Delete_text(ALL_TEXT);
		write(little2,16,70,0,"BROTHER,");
		write(little2,16,90,0,"ARE YOU");
		write(little2,16,110,0,"INSANE ?");
		write(little2,120,300,4,"PRESS TO SKIP");
		if (touch_state > 0) 
		gameplay_finalboss();
		end
		frame;
	end
	
	/*for(i=0;i<120;i++)
		controls();
		Delete_text(ALL_TEXT);
		write(little2,120,70,0,"NO BUT YOU");
		write(little2,120,90,0,"SURE ARE!");
		write(little,120,280,4,"PRESS TO SKIP");
		if (touch_state > 0) 
		gameplay_finalboss();
		end
		frame;
	end*/
	
	for(i=0;i<210;i++)
		controls();
		Delete_text(ALL_TEXT);
		/*write(little2,60,70,3,"AND I'LL DESTROY");
		write(little2,60,90,3,"THIS WORLD FULL");
		write(little2,60,110,3,"OF SEXISTS AND");
		write(little2,60,130,3,"COPYRIGHT NAZIS!");
		write(little,120,280,4,"PRESS TO SKIP");*/
		write(little2,60,70,3,"SHUT UP OR ELSE");
		write(little2,60,90,3,"I WILL SEND YOU");
		write(little2,60,110,3,"BACK TO");
		write(little2,60,130,3,"ARGENTINA !");
		write(little2,120,300,4,"PRESS TO SKIP");
		if (touch_state > 0) 
		gameplay_finalboss();
		end
		frame;
	end
	
	for(i=0;i<160;i++)
		controls();
		Delete_text(ALL_TEXT);
		write(little2,16,70,0,"NO,");
		write(little2,16,90,0,"YOU SHUT UP !");
		write(little2,120,300,4,"PRESS TO SKIP");
		if (touch_state > 0) 
		gameplay_finalboss();
		end
		frame;
	end
	
	for(i=0;i<90;i++)
		controls();
		Delete_text(ALL_TEXT);
		write(little2,70,70,0,"THEN PREPARE TO");
		write(little2,70,90,0,"DIE !");
		write(little2,120,300,4,"PRESS TO SKIP");
		if (touch_state > 0) 
		gameplay_finalboss();
		end
		frame;
	end

	gameplay_finalboss();
	
end


process gameplay_finalboss()
local
p1_ok;
begin
    clear_screen();
	let_me_alone();
	stop_song();
	
	photo();

	exitgame();
	Controls();
	
	abackground_fond();
		
	bird_y = 200;
	bird_y2 = 200;
		
	littlebirdP1(60,bird_fpg);
	littlebirdP2(180,bbird_fpg,400);
	
	// If Music is enabled...
	if (My_struct.music_on == 1)
		div_song = load_song("boss.ogg");
		play_song(div_song,-1);
	end
	
	hour = 0;
	min = 10;
	second = 0;
	micro = 29;
	
		for(i=0;i<90;i++)
		Delete_text(ALL_TEXT);
		write(fnt,120,80,4,"THE LAST");
		write(fnt,120,100,4,"STANDING WINS");
		write(fnt,120,290,4,"GET READY !");
			frame;
		end
		
	text_onscreenP2();
	
	
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

		
	loop
		p1_ok = 0;
		// Used for controlling Player 1
		for(i=0;i<5;i++)
			if(os_id==1003) 
				if (multi_info(i, "ACTIVE") > 0 and multi_info (i, "X") < 230 and multi_info (i, "Y") > 100)
					xm = multi_info (i, "X");
					ym = multi_info (i, "Y");
					p1_ok = 1;
				end
			else
				if (mouse.left == 1 and mouse.x < 130 and mouse.y > 90)
					xm = mouse.x;
					ym = mouse.y;
					p1_ok = 1;
				end
			end
		end

		//if ((xm < 120 and ym > 90) || (xm2 < 120 and ym2 > 90))
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
		
		
			if (second < 1 and min < 1)
			else
				count2 = count2 + 1;
			end
		
		
			if (frotter2 == 0)
				if (count2 > 3)
				tmp2 = 0;
				frotter2 = 1;
				dd3 = ym2;
				count2 = 0;
				end
				
			elseif (frotter2 == 1)
				if (count2 > 3)
				tmp2 = 0;
				frotter2 = 0;
				dd3 = ym2;
				count2 = 0;
				end
			end
		
		
		frame;
	end
	
	guarda_opciones();
	
END




process gameoverP2()
local
string mes2;
begin
	Delete_text(ALL_TEXT);
    clear_screen();
	let_me_alone();
	
	stop_wav(0);
	stop_wav(1);
	stop_wav(2);
	unload_song(div_song);
	
	exitgame();
	
	Controls();
	abackground_fond();

	if (lost_p1 == 1)
		littlebirdP2GO(60,bird_fpg);
	else
		div_song = load_song("victory.ogg");
		play_song(div_song,0);
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

	rand_seed(time());
	gen = rand(0,999);
	
	if (gen < 200)
		mes2 = "S0 LONG, LOSER!";
	elseif (gen < 400)
		mes2 = "HAHAHA, YOU SUCK!";
	elseif (gen < 600)
		mes2 = "TAKE THAT, DUCKLING!";
	elseif (gen < 800)
		mes2 = "I RULE AND YOU SUCK";
	else
		mes2 = "MOUHAHAHAHAHA !";
	end
	
	loop
	
	Delete_text(ALL_TEXT);
	
		if (lost_p1 == 1)
		
			if (tap_time < 29)
				write(fnt,120,120,4,(int)min + ":"+(int)second);
			end
			write(fnt2,120,70,4,"CPU WINS");
			write(little2,120,90,4,mes2);
			
			if (tmp > 30 and touch_state == 1) 
			titlescreen();
			end
			
		else
		write(fnt2,120,70,4,"YOU WIN");
		write(little2,120,90,4,"NOOOOOO!!!");
		
			if (tmp > 30 and touch_state == 1) 
				if (My_struct.second_money > 11999)
				credits_finalboss_good_ending();
				elseif (My_struct.perso1_unlocked == 2 and My_struct.perso2_unlocked == 2 and My_struct.perso3_unlocked == 2 and My_struct.perso4_unlocked == 2 and My_struct.perso5_unlocked == 2 and My_struct.perso6_unlocked == 2 and My_struct.perso7_unlocked == 2 and My_struct.perso8_unlocked == 2)
				credits_finalboss_normal_ending();
				else
				credits_finalboss_bad_ending();
				end
			end
			
		end
		

		

			
			tap_time++;
			if (tap_time > 39)
			tap_time = 0;
			end
			
			
		tmp++;	
		
		frame;
	end
END


process text_onscreenP2()
begin
	loop
		Delete_text(ALL_TEXT);
		
		if (commencer == 1)
			write(fnt,120,80,4,(int)min + ":"+(int)second);
			write(petite_fnt,160,94,4,(int)micro);
		
			micro--;
			
			tmp++;
			tmp2++;
			
			if (micro < 0)
			second = second - 1;
			My_struct.second_money++;
			micro = 29;
			end
			
			if (second < 0)
			second = 59;
			min--;
			end

			
			if (hour == 0 and min == 0 and second < 7)
				if (tmp > 70)
				lost_p1 = 1;
				gameoverP2();
				end 
				
				if (tmp2 > 70)
				lost_p2 = 1;
				gameoverP2();
				end
			else
				if (tmp > 21)
				lost_p1 = 1;
				gameoverP2();
				end 
				
				if (tmp2 > 21)
				lost_p2 = 1;
				gameoverP2();
				end
			end
			

		end
		
	frame;
	end
	
end









process credits_finalboss_bad_ending()
local
credit_y = 300;
time = 0;
begin

    clear_screen();
	let_me_alone();
	stop_song();
	

	loop
		Delete_text(ALL_TEXT);
		controls();
		
		time += 1;
		if (time > 0)
			credit_y = credit_y - 1;
			time = 0;
		end
		
		write(little2,16,credit_y,0,"RUBBY BIRD HAS");
		write(little2,16,credit_y+24,0,"FINALLY DEFEATED ");
		write(little2,16,credit_y+(24*2),0,"HIS EVIL BROTHER");
		
		write(little2,16,credit_y+(24*4),0,"THE WORLD IS NOW");
		write(little2,16,credit_y+(24*5),0,"IN PEACE BUT THERE");
		write(little2,16,credit_y+(24*6),0,"ARE STILL CHILDREN");
		write(little2,16,credit_y+(24*7),0,"DYING IN AFRICA.");
		
		write(little2,16,credit_y+(24*9),0,"KEEP RUBBING AND");
		write(little2,16,credit_y+(24*10),0,"COME BACK WHEN YOU");
		write(little2,16,credit_y+(24*11),0,"ARE LITTLE MORE MMMM");
		write(little2,16,credit_y+(24*12),0,"RICHER !");
		
		write(little2,16,credit_y+(24*14),0,"( YOU NEED TO HAVE");
		write(little2,16,credit_y+(24*15),0,"  12000 points )");
		
		if (credit_y < -380)
			titlescreen();
		end
		
		
		frame;
	end
	
end




process credits_finalboss_normal_ending()
local
credit_y = 300;
time = 0;
begin

    clear_screen();
	let_me_alone();
	stop_song();
	
	abackground_fond();

	loop
		Delete_text(ALL_TEXT);
		controls();
		
		time += 1;
		if (time > 0)
			credit_y = credit_y - 1;
			time = 0;
		end
		
		write(little2,16,credit_y,0,"RUBBY BIRD HAS");
		write(little2,16,credit_y+24,0,"FINALLY DEFEATED ");
		write(little2,16,credit_y+(24*2),0,"HIS EVIL BROTHER");
		
		write(little2,16,credit_y+(24*4),0,"THE WORLD IS NOW");
		write(little2,16,credit_y+(24*5),0,"IN PEACE BUT THERE");
		write(little2,16,credit_y+(24*6),0,"ARE STILL CHILDREN");
		write(little2,16,credit_y+(24*7),0,"DYING IN AFRICA.");
		
		write(little2,16,credit_y+(24*9),0,"OH WELL.");
		write(little2,16,credit_y+(24*10),0,"AT LEAST AFRICANS");
		write(little2,16,credit_y+(24*11),0,"HAVE RUBBY BIRD's");
		write(little2,16,credit_y+(24*12),0,"FRIENDS TO PLAY WITH");
		
		write(little2,16,credit_y+(24*14),0,"KEEP RUBBING AND");
		write(little2,16,credit_y+(24*15),0,"COME BACK WHEN YOU");
		write(little2,16,credit_y+(24*16),0,"ARE LITTLE MORE MMMM");
		write(little2,16,credit_y+(24*17),0,"RICHER !");
		
		write(little2,16,credit_y+(24*19),0,"( YOU NEED TO HAVE");
		write(little2,16,credit_y+(24*20),0,"  12000 points )");
		
		if (credit_y < -480)
			titlescreen();
		end
		
		
		frame;
	end
	
end



process credits_finalboss_good_ending()
local
credit_y = 300;
time = 0;
begin

    clear_screen();
	let_me_alone();
	stop_song();
	
	if (My_struct.music_on == 1)
		div_song = load_song("credits.ogg");
		play_song(div_song,-1);
	end
	
	abackground_fond();

	loop
		Delete_text(ALL_TEXT);
		controls();
		
		time += 1;
		if (time > 0)
			credit_y = credit_y - 1;
			time = 0;
		end
		
		write(little2,16,credit_y,0,"RUBBY BIRD HAS");
		write(little2,16,credit_y+24,0,"FINALLY DEFEATED ");
		write(little2,16,credit_y+(24*2),0,"HIS EVIL BROTHER");
		
		write(little2,16,credit_y+(24*4),0,"THE WORLD IS NOW");
		write(little2,16,credit_y+(24*5),0,"IN PEACE AND");
		write(little2,16,credit_y+(24*6),0,"CHILDREN IN AFRICA");
		write(little2,16,credit_y+(24*7),0,"CAN NOW EAT.");
		
		write(little2,16,credit_y+(24*9),0,"RUBBY BIRD WAS");
		write(little2,16,credit_y+(24*10),0,"LATER FOUND");
		write(little2,16,credit_y+(24*11),0,"MURDERED ON HIS BED");
		write(little2,16,credit_y+(24*12),0,"THE 16TH SEPTEMBER");
		
		write(little2,16,credit_y+(24*14),0,"NOBODY KNOWS");
		write(little2,16,credit_y+(24*15),0,"WHY HE WAS KILLED");
		write(little2,16,credit_y+(24*16),0,"BUT APPARENTLY HE");
		write(little2,16,credit_y+(24*17),0,"KNEW HE WAS GOING");
		write(little2,16,credit_y+(24*18),0,"TO DIE...");
		
		write(little2,16,credit_y+(24*20),0,"THE END");
		
		if (credit_y < -480)
			titlescreen();
		end
		
		
		frame;
	end
	
end


