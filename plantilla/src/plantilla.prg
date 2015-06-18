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

program openrubbybird;

import "mod_dir";
import "mod_draw";
IMPORT "mod_effects";
import "mod_grproc";
import "mod_map";
import "mod_mouse";
import "mod_multi";
import "mod_proc";
import "mod_rand";
import "mod_time";
import "mod_screen";
import "mod_scroll";
import "mod_sound";
import "mod_string";
import "mod_text"; 
import "mod_timers";
import "mod_video";
import "mod_wm";
import "mod_file";
import "mod_joy";
import "mod_math";
import "mod_sys";
import "mod_regex";
import "mod_key";
IMPORT "mod_say";



global
	alpha_title = 255;

	touch_state = 0; 
	touch_time = 0;
	touch_statep2 = 0; 
	touch_timep2 = 0;
	
	/*
	0 = No Touch
	1 = Just pressed (lengh = 0.2s)
	2 = Holding
	3 = Released (lengh = 0.2s)
	*/


	//utilizadas por controles.pr-
	posibles_jugadores;
	struct p[100];
		botones[7];
		control;
	end
	joysticks[10];
	
	//utilizadas por explosion.pr-
	ancho;
	alto;
	//---------------fin explosion.pr-

	//utilizadas por mod_text2.pr-
	accion;
	//---------------fin mod_text2.pr-
	foo;
	string lang_string;
	
	//utilizadas por lenguaje y savepath
	string savegamedir;
	string developerpath="/.gameblabla/rubbybird";
	struct ops;
		test=0;
	end
	//---------------fin lenguaje y savepath
	
	//utilizadas por mod_text2.pr-
	global_resolution=1;
	//---------------fin mod_text2.pr-
	
	//utilizadas por resolucioname.pr-
	arcade_mode;
	//
	width , height , panoramico , bpp;
	alto_pantalla , ancho_pantalla;

    struct My_struct
		highscore_h = 0;
		highscore_m = 0;
		highscore_s = 0;
		second_money = 0;
		perso1_unlocked = 1;
		perso2_unlocked = 1;
		perso3_unlocked = 1;
		perso4_unlocked = 1;
		perso5_unlocked = 1;
		perso6_unlocked = 1;
		perso7_unlocked = 1;
		perso8_unlocked = 1;
		intro = 0;
		boss_final = 0;
		screenshot_number = 0;
		gfx_on = 1;
		music_on = 1;
	end
	
	/*
		SOUND AND MUSIC
		ON OR OFF
	*/

	

LEFT_PRESSED , RIGHT_PRESSED , UP_PRESSED , DOWN_PRESSED , B1_PRESSED , B2_PRESSED;
Choose_before = 0;
choosey = 64;

title_y = -64;
showing_mode = 0;
wait_pad;

Fonte , Fonte2;
TEXT1;
time_commandwait , fpschoosed;
fpg1;
tir=0, wait_tir;

player_x , player_y;

h1_x , h1_y;

cass1_x , cass1_y;
cass2_x , cass2_y;

shatter_time , shattering;
inc , inc_time;
lives=3;

sound1 , sound2 , sound3;
sound4, sound5 , sound6 , sound7;
xm , ym;
wait_bird;

red,green,blue;

newpixel_r,newpixel_g,newpixel_b;
oldpixel_r,oldpixel_g,oldpixel_b;
c;

frame_back;
float hour = 0,second = 0,min = 0;
float hour2 = 0,second2 = 0,min2 = 0;
string str;
micro = 0;
fnt;
music , music2;
i;

frotter = 0;
commencer = 0;
x_b , y_b;
bird_y;
bird_y2;
fnt2,fnt3;

tmp;
B1_button;
little , little2;
pt_y;
counter;
fpg3;
dd2;
count , count2;

bird_fpg , bbird_fpg , twit_fpg , ouya_fpg , monkey_fpg , abird_fpg , coin_fpg , back4_fpg;
tuc_fpg , haku_fpg , fenix_fpg , ramu_fpg , back1_fpg , back2_fpg , back3_fpg;
ptit_fpg;
petite_fnt;

tap_time , tit , fnt_highscore;
frotter2 , tmp2 , dd3 , xm2 , ym2;

lost_p1 , lost_p2;
div_song;
fpg_choose , size_perso;
caca , frot;
buy_sound;


angle_ramu = 0;
size_ramu = 100 , mode_ramu = 0;
personnage_choosed = 0 , fond_choosed = 0;
swip = 0;
void_fpg , dyna_fpg , baka_fpg , kachoo_fpg , lila_fpg , bird_gauche_fpg;
fnt_gameover , little3;

mmx , mmy;
mmx2 , mmy2;
mmx3 , mmy3;
gen , sasa;

    int takingscreenshot = 0;
	int graph_screen;
	
B1_PRESSED_P2, touch_state_p2, touch_time_P2;

voice1, voice2, voice3, voice4, voice5;
character_is_bird;
begin

	set_fps(30,0);
	
	width=240;
	height=320;
	panoramico=0;
	bpp=16; // Set the color depth , 16 bits is a bit faster than 32 bits
	text_z = -2;
	
    Load("savebird",My_Struct); // Load a structure from a file , if it can't find a file then nothing will be loaded
	
	// Functions that resize according the device's screen
	resolucioname(width,height,panoramico);
	set_mode(width,height,bpp);
	
	//sasa = load_fpg("sasa.fpg") ;
	fpg1 = load_fpg("game.fpg") ;
	fpg3 = load_fpg("hand.fpg") ;
	
	baka_fpg = load_fpg("afond.fpg") ;
	bird_fpg = load_fpg("bird.fpg") ;
	bird_gauche_fpg = load_fpg("bbird_gauche.fpg") ;
	bbird_fpg = load_fpg("bbird.fpg") ;
	twit_fpg = load_fpg("twit.fpg") ;
	abird_fpg = load_fpg("abird.fpg") ;
	monkey_fpg = load_fpg("monkey.fpg") ;
	ouya_fpg = load_fpg("ouya.fpg") ;
	
	tuc_fpg = load_fpg("tuc.fpg") ;
	haku_fpg = load_fpg("haku.fpg") ;
	fenix_fpg = load_fpg("fenix.fpg") ;
	coin_fpg = load_fpg("coinye.fpg") ;
	ramu_fpg = load_fpg("ramu.fpg") ;
	void_fpg = load_fpg("void.fpg") ;
	dyna_fpg = load_fpg("dyna.fpg") ;
	kachoo_fpg = load_fpg("kakachoo.fpg") ;
	lila_fpg = load_fpg("lila.fpg") ;
	
	back1_fpg = load_fpg("fond.fpg") ;
	back2_fpg = load_fpg("fond2.fpg") ;
	back3_fpg = load_fpg("fond3.fpg") ;
	back4_fpg = load_fpg("fond4.fpg") ;
	
	petite_fnt = fnt_load("petite_font.fpg");
	ptit_fpg = fnt_load("ptit.fpg");
	
	fnt = fnt_load("font_text.fpg");
	fnt2 = fnt_load("df.fnt.fpg") ;
	fnt3 = fnt_load("text.fpg") ;
	
	little = fnt_load("numb.fpg") ;
	little2 = fnt_load("numb2.fpg") ;
	little3 = fnt_load("numb3.fpg") ;
	
	tit = fnt_load("tit.fpg") ;
	fnt_highscore = fnt_load("highscore.fpg") ;
	fnt_gameover = fnt_load("font_gameover.fpg") ;
	
	sound1 = load_wav("select.wav");
	sound3 = load_wav("lose.wav");
	sound4 = load_wav("confirm.wav");
	sound5 = load_wav("tweet.wav");
	sound6 = load_wav("dies.wav");
	buy_sound = load_wav("buy.wav");
	
	voice1 = load_wav("keepitup.wav");
	voice2 = load_wav("keeprubbing.wav");
	voice3 = load_wav("ninehourstraight.wav");
	voice4 = load_wav("rubbinfortwentynine.wav");
	voice5 = load_wav("goodjob.wav");
	
	loop
		titlescreen();
	frame;
	end
END


process exitgame()
begin
		loop
			if (key(_esc)) // PC // Quittez le jeu
			EXIT(0,0);
			end
		 frame;
		 end
END

include "2players.prg";
include "titlescreen.prg"
include "gameplay.prg"
include "controls.prg";
include "finalboss.prg";

include "controles.pr-";
include "explosion.pr-";
include "lenguaje.pr-";
include "savepath.pr-";
include "resolucioname.pr-";
