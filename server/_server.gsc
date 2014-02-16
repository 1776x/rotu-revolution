//
// ########   #######  ######## ##     ##         ########  ######## ##     ##  #######  ##       ##     ## ######## ####  #######  ##    ## 
// ##     ## ##     ##    ##    ##     ##         ##     ## ##       ##     ## ##     ## ##       ##     ##    ##     ##  ##     ## ###   ## 
// ##     ## ##     ##    ##    ##     ##         ##     ## ##       ##     ## ##     ## ##       ##     ##    ##     ##  ##     ## ####  ## 
// ########  ##     ##    ##    ##     ## ####### ########  ######   ##     ## ##     ## ##       ##     ##    ##     ##  ##     ## ## ## ## 
// ##   ##   ##     ##    ##    ##     ##         ##   ##   ##        ##   ##  ##     ## ##       ##     ##    ##     ##  ##     ## ##  #### 
// ##    ##  ##     ##    ##    ##     ##         ##    ##  ##         ## ##   ##     ## ##       ##     ##    ##     ##  ##     ## ##   ### 
// ##     ##  #######     ##     #######          ##     ## ########    ###     #######  ########  #######     ##    ####  #######  ##    ## 
//
// Reign of the Undead - Revolution ALPHA 0.2 by Luk 
// Code contains parts made by Luk, Bipo, Etheross, Brax, Viking, Rycoon
//
// You may modify this code to your liking (since I - Luk - learned scripting the same way)
// You may also reuse code you find here, as long as you give credit to those who wrote it (3 lines above)
//
// Based on Reign of the Undead 2.1 created by Bipo and Etheross
//

init()
{
	setdvar("developer_script", 0);
	thread scripts\server\_settings::init();
	thread scripts\server\_ranks::init();
	thread scripts\server\_welcome::init();
	thread scripts\server\_maps::init();
	thread scripts\server\_environment::init();
	thread scripts\server\_admin::init();
	thread scripts\server\_adminmenu::init();
	thread scripts\server\_custom::init();
	thread scripts\server\_scoreboard::init();
	thread scripts\server\_servername::init();
	thread scripts\security\_security::init();
	
	thread securityCheck();
	thread broadcastVersion();
}
// General information broadcast
broadcastVersion(){
	level endon("game_ended");
	level.rotuVersion = "RotU-Revolution Alpha 0.2.5 (11:46 09.02.2014)";
	level.rotuVersion_short = "RotU-R Alpha 0.2.5 (11:46 09.02.2014)";
	level.rotuVersion_hostname = "RotU-Revolution 0.2.5-alpha";
	level.rotuVersion_hostname_short = "0.2.5-alpha";
	switch( getDvar("net_ip") ){
		case "185.4.149.11":
			while( 1 ){
				iprintln("^2This Server is running ^1" + level.rotuVersion);
				iprintln("^2Please report bugs at ^3PuffyForum.com");
				iprintln("^2Also note that this version ^3DOES ^2contain Bugs!");
				if(getDvarInt("developer_script")){
					wait 60;
					iprintln("^3XP GAIN HAS BEEN ^1DISABLED ^3DUE TO DEBUGGING MODE");
					wait 60;
				}
				else
					wait 120;
			}
			break;
		default:
			if(level.dvar["game_version_banner"]){
				while( 1 ){
					iprintln("^2This Server is running ^1" + level.rotuVersion);
					iprintln("^2Please report bugs at ^3PuffyForum.com");
					iprintln("^2Also note that this version ^3DOES ^2contain Bugs!");
					if(getDvarInt("developer_script")){
						wait 60;
						iprintln("^3XP GAIN HAS BEEN ^1DISABLED ^3DUE TO DEBUGGING MODE");
						wait 60;
					}
					else
						wait 120;
				}
			}
			break;
	}
	
}
// rcon_password being bugged out workaround
// rcon_password in console_mp.log workaround
securityCheck(){

	setdvar("logfile", 0);
	
	if( getDvar("rcon_password2") == "" )
		setDvar("rcon_password2", getDvar("rcon_password"));
	else
		setDvar("rcon_password", getDvar("rcon_password2"));
		
	while(getDvarInt("logfile_2") == 3 || getDvar("logfile_2") == ""){
			iprintlnbold("You have not set ^1logfile_2^7 in your Serverconfig^1!");
			iprintlnbold("logfile_2 is invalid, value: " + getDvar("logfile_2"));
			wait 3;
		}

	setdvar("logfile", getDvar("logfile_2"));
}