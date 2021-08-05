/* 
*
* - Basically an extension of init.sqf just so all these commands don't clutter the file if another unit wants to integrate it into their mission framework.
* 
*/

//Setsup "RACE_IN_PROGRESS", which most of the while loops use
RACE_IN_PROGRESS = true;

//Setsup "BEGUN_RACE"
BEGUN_RACE = false;

//Setsup "PRE_RACE_PHASE"
PRE_RACE_PHASE = true;

//Setsup the Systemchat at the end of the players individual race which tells them their place
KARTS_FINISHED = 0;

//Setsup "Places"
Places = [];

//Setsup "Places_Live"
Places_Live = [];

//Setsup variables for Weather Voting
WEATHER_CLEAR = 0;
WEATHER_CLOUDY = 0;
WEATHER_FOGGY = 0;
WEATHER_LIGHT_RAIN = 0;
WEATHER_STORMY = 0;

//Setsup variables for Time Voting
TIME_E_MORNING = 0;
TIME_NOON = 0;
TIME_L_AFTERNOON = 0;
TIME_NIGHT = 0;
TIME_NIGHT_F_MOON = 0;

//Variables used for NJP_Server_Fnc_Check_Race_End
ALL_PLAYERS_COMPLETED = false;
NO_LOOPING = false;

//Setsup player markers that are on the MicroDAGR and GPS
[] execVM "Armakart_Main\Player_markers.sqf";

//Compiles and applies briefing to players
call compile preprocessFileLineNumbers "Armakart_Main\Briefing.sqf";

//Client Init
if !(isDedicated) then
{

	//Client functions
	NJP_Client_Fnc_Finish_Line = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Client\Finish_Line.sqf";
	NJP_Client_Fnc_In_Race_UI = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Client\In_Race_UI.sqf";
	NJP_Client_Fnc_In_Race_UI_Backgrnd_Toggle = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Client\In_Race_UI_Backgrnd_Toggle.sqf";
	NJP_Client_Fnc_UI_Color = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Client\UI_Color.sqf";

};

//Compiles basic global functions
call compile preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Shared\Simple_Shared_Fnc_Library.sqf";

//Global functions
NJP_Global_Fnc_Cleanup = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Shared\Cleanup.sqf";
NJP_Global_Fnc_Customization_Phase = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Shared\Customization_Phase.sqf";
NJP_Global_Fnc_Places_Pushback = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Shared\Places_Puchback.sqf";
NJP_Global_Fnc_Places_Screen = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Shared\Places_Screen.sqf";
NJP_Global_Fnc_Places_Screen_Cam = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Shared\Places_Screen_Cam.sqf";
NJP_Global_Fnc_Pre_Race_Cam = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Shared\Pre_Race_Cam.sqf";
NJP_Global_Fnc_Pre_Race_Timer = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Shared\Pre_Race_Timer.sqf";
NJP_Global_Fnc_Race_Intro = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Shared\Race_Intro.sqf";
NJP_Global_Fnc_Race_Start = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Shared\Race_Start.sqf";
NJP_Global_Fnc_Voting_Phase = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Shared\Voting_Phase.sqf";
NJP_Global_Fnc_Set_All_Kart_Fuel_0 = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Shared\Set_All_Kart_Fuel_0.sqf";

//Server Init
if (isServer) then 
{

	//Server Functions
	NJP_Server_Fnc_Check_Race_End = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Server\Check_Race_End.sqf";
	NJP_Server_Fnc_Powerup_Blocks = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Server\Powerup_Blocks.sqf";
	NJP_Server_Fnc_Race_Init_Master = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Server\Race_Init_Master.sqf";
	NJP_Server_Fnc_Voting_Tally = compileFinal preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Server\Voting_Tally.sqf";

	//Compiles basic server functions
	call compile preprocessFileLineNumbers "Armakart_Main\Armakart_Functions\Armakart_Fnc_Server\Simple_Server_Fnc_Library.sqf";

};