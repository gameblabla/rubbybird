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


process Controls()
begin
		if(os_id!=1003) 
			hand();
		end

	loop
			if(os_id==1003) 
				mmx = multi_info (0, "X");
				mmy = multi_info (0, "Y");
				mmx2 = multi_info (1, "X");
				mmy2 = multi_info (1, "Y");
				mmx3 = multi_info (2, "X");
				mmy3 = multi_info (2, "Y");
			else
				mmx = mouse.x;
				mmy = mouse.y;
				mmy2 = 0;
				mmx2 = 0;
				mmy3 = 0;
				mmx3 = 0;
			end
	
			if(os_id==1003 and !focus_status) 
				salir_android();
			end

			if (key(_left))
				LEFT_PRESSED = 1;
				else
				LEFT_PRESSED = 0;
			end
			
			if (key(_right))
				RIGHT_PRESSED = 1;
			else
				RIGHT_PRESSED = 0;
			end
			
			if (key(_up))
				UP_PRESSED = 1;
			else
				UP_PRESSED = 0;
			end
			
			if (key(_down))
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
				elseif (multi_info(0, "ACTIVE") > 0)
					B1_PRESSED = 1;
					touch_state = 1;
					xm = mmx;
					ym = mmy;
				elseif ((multi_info(1, "ACTIVE") > 0))
					B1_PRESSED = 1;
					touch_state = 1;
					xm = mmx2;
					ym = mmy2;
				elseif ((multi_info(2, "ACTIVE") > 0))
					B1_PRESSED = 1;
					touch_state = 1;
					xm = mmx3;
					ym = mmy3;
				end
				
			end
			
			if (touch_state == 1) // Si l'utilisateur vient d'apputer
			
				if (mouse.left)
					touch_time++;
					xm = mmx;
					ym = mmy;
				elseif ((multi_info(0, "ACTIVE") > 0))
					touch_time++;
					xm = mmx;
					ym = mmy;
				elseif ((multi_info(1, "ACTIVE") > 0))
					touch_time++;	
					xm = mmx2;
					ym = mmy2;
				elseif ((multi_info(2, "ACTIVE") > 0))
					touch_time++;	
					xm = mmx3;
					ym = mmy3;
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
				elseif ((multi_info(0, "ACTIVE") > 0))
					xm = mmx;
					ym = mmy;
				elseif ((multi_info(1, "ACTIVE") > 0))
					xm = mmx2;
					ym = mmy2;
				elseif ((multi_info(2, "ACTIVE") > 0))
					xm = mmx3;
					ym = mmy3;
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
			
			
			
			
			
				/* TOUCHSCREEN CONTROL FOR PLAYER 2 */
				
				
				/*
				if (touch_state_p2 == 0) // Si il n'y a aucune pression
				B1_PRESSED_P2 = 0;
				
					if ((multi_info(0, "ACTIVE") > 0))
						B1_PRESSED_P2 = 1;
						touch_state_p2 = 1;
						xm2 = mmx;
						ym2 = mmy;
					elseif ((multi_info(1, "ACTIVE") > 0))
						B1_PRESSED_P2 = 1;
						touch_state_p2 = 1;
						xm2 = mmx2;
						ym2 = mmy2;
					elseif ((multi_info(2, "ACTIVE") > 0))
						B1_PRESSED_P2 = 1;
						touch_state_p2 = 1;
						xm2 = mmx3;
						ym2 = mmy3;
					end
					
				end
				
				if (touch_state_p2 == 1) // Si l'utilisateur vient d'apputer
				
					if ((multi_info(0, "ACTIVE") > 0))
						touch_time_P2++;
						xm2 = mmx;
						ym2 = mmy;
					elseif ((multi_info(1, "ACTIVE") > 0))
						touch_time_P2++;	
						xm2 = mmx2;
						ym2 = mmy2;
					elseif ((multi_info(2, "ACTIVE") > 0))
						touch_time_P2++;	
						xm2 = mmx3;
						ym2 = mmy3;
					else
						touch_time_P2 = 0;
						touch_state_p2 = 0;
					end
					
					if (touch_time_P2 > 3)
						touch_time_P2 = 0;
						touch_state_p2 = 2;
					end
				end
				
				if (touch_state_p2 == 2) // Si il presse
				
					if ((multi_info(0, "ACTIVE") > 0))
						xm2 = mmx;
						ym2 = mmy;
					elseif ((multi_info(1, "ACTIVE") > 0))
						xm2 = mmx2;
						ym2 = mmy2;
					elseif ((multi_info(2, "ACTIVE") > 0))
						xm2 = mmx3;
						ym2 = mmy3;
					else
						touch_time_P2 = 0;
						touch_state_p2 = 3;
						B1_PRESSED_P2 = 0;
					end
				end
				
				if (touch_state_p2 == 3) // Si il vient de lacher
						touch_time_P2++;
						if (touch_time_P2 > 3)
							touch_time_P2 = 0;
							touch_state_p2 = 0;
						end
				end
				*/
		
	  frame;
	end
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
	if(exists(father)) signal(father,s_wakeup); end
	from i=0 to 9;
		timer_store[i]=timer[i];
	end
	pause_song();
end


function resume_game();
local
i,timer_store[11];
begin
	signal(ALL_PROCESS,s_wakeup);
	from i=0 to 9;
		timer[i]=timer_store[i];
	end
	resume_song();
end

