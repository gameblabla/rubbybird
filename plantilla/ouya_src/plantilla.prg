program cupidon;

import "mod_blendop";
//import "mod_cd";
#IFDEF debug
import "mod_debug";
#ENDIF
//import "mod_mem";
import "mod_effects";
import "mod_flic";
import "mod_m7";
import "mod_path";
import "mod_grproc";
import "mod_dir";
import "mod_draw";
import "mod_file";
import "mod_joy";
import "mod_key";
import "mod_map";
import "mod_math";
import "mod_mouse";
import "mod_multi"; //ya la carga controles si es necesaria
import "mod_proc";
import "mod_rand";
import "mod_regex";
import "mod_say";
import "mod_screen";
import "mod_scroll";
import "mod_sort";
import "mod_sound";
import "mod_string";
import "mod_sys";
import "mod_text";
import "mod_time";
import "mod_timers";
import "mod_video";
import "mod_wm";




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
	width  , panoramico , bpp;
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
	end
	
	

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
sound4 , sound5 , sound6;
sound7 , sound8 , sound9;
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
sound10 , sound11 , sound12 , sound16;
sound17 , sound18;
little , little2;
sound15;
pt_y;
counter;
fpg3;
dd2;
count , count2;

bird_fpg , bbird_fpg , twit_fpg , ouya_fpg , monkey_fpg , abird_fpg , coin_fpg , back4_fpg;
tuc_fpg , haku_fpg , fenix_fpg , reimu_fpg , back1_fpg , back2_fpg , back3_fpg;
ptit_fpg;
fond_choosed = 0;
petite_fnt;

tap_time , tit , fnt_highscore;
frotter2 , tmp2 , dd3 , xm2 , ym2;

lost_p1 , lost_p2;
div_song;
personnage_choosed = 0;
fpg_choose , size_perso;
caca , frot;
buy_sound;
swip = 0;

angle_touhou = 0;
size_touhou = 100 , mode_touhou = 0;
void_fpg , dyna_fpg , baka_fpg , kachoo_fpg , ouyaa;
fnt_gameover , little3;

mmx , mmy;
mmx2 , mmy2;
choice_x , choice_y , ch = 0;
B3_PRESSED , B4_PRESSED;
	cant = 0;
	
mojo = 0 , con = 0;
begin

	set_fps(60,0);
	
	width=320;
	height=180;
	panoramico=0;
	bpp=16; // Set the color depth , 16 bits is a bit faster than 32 bits
	text_z = -2;
	
	//configurar_controles(); // Configure controls , need to be run only one time (Needed for controllers and OUYA)
	
	// Functions that resize according the device's screen
	resolucioname(width,height,panoramico);
	set_mode(width,height,bpp);
	
	fpg1 = load_fpg("game.fpg") ;
	fpg3 = load_fpg("hand.fpg") ;
	
	baka_fpg = load_fpg("afond.fpg") ;
	bird_fpg = load_fpg("bird.fpg") ;
	bbird_fpg = load_fpg("bbird.fpg") ;
	twit_fpg = load_fpg("twit.fpg") ;
	abird_fpg = load_fpg("abird.fpg") ;
	monkey_fpg = load_fpg("monkey.fpg") ;
	ouya_fpg = load_fpg("stick.fpg") ;
	
	ouyaa = load_fpg("ouyaa.fpg") ; 
	
	tuc_fpg = load_fpg("tuc.fpg") ;
	haku_fpg = load_fpg("haku.fpg") ;
	fenix_fpg = load_fpg("fenix.fpg") ;
	coin_fpg = load_fpg("coinye.fpg") ;
	reimu_fpg = load_fpg("ramu.fpg") ;
	void_fpg = load_fpg("void.fpg") ;
	dyna_fpg = load_fpg("dyna.fpg") ;
	kachoo_fpg = load_fpg("kakachoo.fpg") ;
	
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
	sound2 = load_wav("keepitup.wav");
	sound3 = load_wav("lose.wav");
	sound4 = load_wav("confirm.wav");
	sound5 = load_song("cry.ogg");
	sound6 = load_wav("rub.wav");
	
	sound7 = load_wav("youvekeep29hours.wav");
	sound8 = load_wav("youvekeep9hours.wav");
	sound9 = load_wav("goodjobkeep.wav");
	sound10 = load_wav("rubbybird.wav");
	
	sound11 = load_wav("rubitup.wav");
	sound12 = load_wav("fuckit.wav");
	sound15 = load_wav("dies.wav");
	sound16 = load_wav("keeprub.wav");
	
	sound17 = load_wav("rubbin9hours.wav");
	sound18 = load_wav("rubbin29hours.wav");
	
	buy_sound = load_wav("buy.wav");
	
    Load("savebird",My_Struct); // Load a structure from a file , if it can't find a file then nothing will be loaded
	
	configurar_controles();
	
	loop
	
		titlescreen();
		frame;
		
	end
	
	//guarda_opciones();
	
END



include "titlescreen.prg"
include "gameplay.prg"
include "controls.prg";

include "controles.pr-";
include "explosion.pr-";
include "lenguaje.pr-";
include "savepath.pr-";
include "resolucioname.pr-";