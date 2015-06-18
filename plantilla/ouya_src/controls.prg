process Controls()
begin
	tmp = 0;

	B1_PRESSED = 0;
	B2_PRESSED = 0;
	B3_PRESSED = 0;
	B4_PRESSED = 0;
	
	LEFT_PRESSED = 0;
	RIGHT_PRESSED = 0;
	UP_PRESSED = 0;
	DOWN_PRESSED = 0;
	
	controlador(0);
	
	loop

		mmx = mouse.x;
		mmy = mouse.y;
		
		if(os_id==1003 and !focus_status) 
			salir_android();
		end
	
		/* BUTTON LEFT */
	
		
		if (key(_left) || p[0].botones[0])
			LEFT_PRESSED = 1;
		else
			LEFT_PRESSED = 0;
		end
		
		if (key(_right) || p[0].botones[1])
			RIGHT_PRESSED = 1;
		else
			RIGHT_PRESSED = 0;
		end
		
		if (key(_up) || p[0].botones[2])
			UP_PRESSED = 1;
		else
			UP_PRESSED = 0;
		end
		
		if (key(_down) || p[0].botones[3])
			DOWN_PRESSED = 1;
		else
			DOWN_PRESSED = 0;
		end


		
		
			/* TOUCHSCREEN CONTROL FOR PLAYER 1*/
			
			
		if (touch_state == 0) // Si il n'y a aucune pression
		B1_PRESSED = 0;
		
			if (mouse.left)
				B1_PRESSED = 1;
				touch_state = 1;
				xm = mmx;
				ym = mmy;
			end
			
		end
		
		if (touch_state == 1) // Si l'utilisateur vient d'apputer
		
			if (mouse.left)
				touch_time++;
				xm = mmx;
				ym = mmy;
			else
				touch_time = 0;
				touch_state = 0;
			end
			
			if (touch_time > 3)
				touch_time = 0;
				touch_state = 2;
			end
		end
		
		if (touch_state == 2) // Si il presse
		
			if (mouse.left)
				xm = mmx;
				ym = mmy;
			else
				touch_time = 0;
				touch_state = 3;
				B1_PRESSED = 0;
			end
		end
		
		if (touch_state == 3) // Si il vient de lacher
				touch_time++;
				if (touch_time > 3)
					touch_time = 0;
					touch_state = 0;
				end
		end
		
		if (key(_x) || p[0].botones[5]) // VALIDATION BUTTON
			B3_PRESSED = 1;
		else
			B3_PRESSED = 0;
		end
		
		if (key(_c) || p[0].botones[6]) // CANCEL BUTTON
			B4_PRESSED = 1;
		else
			B4_PRESSED = 0;
		end
		
		
		
	  frame;
	end
	
		//guarda_opciones();
	
END


function salir_android();
begin
	pause_game();
	while(!focus_status) frame; end
	resume_game();
end


function pause_game();
local
i,timer_store[11];
begin
	signal(ALL_PROCESS,s_freeze);
	if(exists(father)) 
		signal(father,s_wakeup);
	end
	/*from i=0 to 9;
		timer_store[i]=timer[i];
	end*/
	pause_song();
end


function resume_game();
local
i,timer_store[11];
begin
	signal(ALL_PROCESS,s_wakeup);
	/*from i=0 to 9;
		timer[i]=timer_store[i];
	end*/
	resume_song();
end


