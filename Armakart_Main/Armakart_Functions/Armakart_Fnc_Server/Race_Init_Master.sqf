/* 
*
* - Initializes the race.
* 
*/

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart| : Begun Race init & started Customization Phase.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

//Adds global variable for music loop
ehID = addMusicEventHandler ["MusicStop", {music_isPlaying = false}];

//Starts Customization Phase music and loops it
[] Spawn
{

	while {PRE_RACE_PHASE} do
	{

		music_isPlaying = true;
		"Customization_Phase" remoteExec ["playMusic", 0, false];
		waitUntil
		{
			uiSleep 1;

			not music_isPlaying
		};

	};
	
};

//Removes Safestart
[false] call potato_safeStart_fnc_toggleSafeStart;

//Starts Customization Phase
Pre_Race_Time = time + Customization_Phase_Time;
publicVariable "Pre_Race_Time";

remoteExec [ "NJP_Global_Fnc_Pre_Race_Timer", 0, false ];

remoteExec [ "NJP_Global_Fnc_Customization_Phase", 0, false ];
remoteExec [ "NJP_Global_Fnc_Pre_Race_Cam", 0, false ];

//Sets plaver vic fuel to 0
remoteExec [ "NJP_Global_Fnc_Set_All_Kart_Fuel_0", 0, false ];

uiSleep Customization_Phase_Time;

if (Voting_Phase_Enabled isEqualTo 1) then {

	diag_log "//----------------------------------------------------------------------------\\";
	diag_log "|Armakart| : Completed Customization Phase.";
	diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
	diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
	diag_log "\\----------------------------------------------------------------------------//";

	uiSleep 1.2;

	remoteExec ["NJP_Global_Fnc_Voting_Phase", 0, false];

	Pre_Race_Time = time + Voting_Phase_Time;
	publicVariable "Pre_Race_Time";

	remoteExec [ "NJP_Global_Fnc_Pre_Race_Timer", 0, false ];

	uiSleep Voting_Phase_Time;

	call NJP_Server_Fnc_Voting_Tally;

	waitUntil {!PRE_RACE_PHASE};

} else {

	diag_log "//----------------------------------------------------------------------------\\";
	diag_log "|Armakart| : Completed Customization Phase & skipped Voting phase.";
	diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
	diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
	diag_log "\\----------------------------------------------------------------------------//";

	PRE_RACE_PHASE = false;

};

//One-off Cleanup Script to make the intro look nice
remoteExec ["NJP_Global_Fnc_Cleanup", 0, false];

//Sets plaver vic fuel to 0 just in case anyone jip'd 
remoteExec [ "NJP_Global_Fnc_Set_All_Kart_Fuel_0", 0, false ];

//Starts Race
remoteExec ["NJP_Global_Fnc_Race_Intro", 0, false];

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart| : Started Race Intro.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

//Initializes powerup blocks
call NJP_Server_Fnc_Powerup_Blocks;

//Do title
_author = getMissionConfigValue ["Author", 0];
_cmfvers = getText (missionConfigFile >> "cmfVers");

[

	[

		[Track_Title,"<t align = 'center' shadow = '1' size = '1.5' font = 'PuristaBold' >%1</t><br/>",15],

		["By: " + _author,"<t align = 'center' shadow = '1' size = '1.2'>%1</t><br/>",10],

		[_cmfvers,"<t align = 'center' shadow = '1' size = '1'>%1</t><br/>",35]

	] , 1, 0.85

] remoteExec ["BIS_fnc_typeText", 0, false];

waitUntil { BEGUN_RACE };

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart| : Started Race.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

//Starts checking if players finish (Have to spawn so the rest of the script executes)
[] Spawn { call NJP_Server_Fnc_Check_Race_End; };

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart| : Begun global checks and sorting & calling of player places.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

"" remoteExec ["playMusic", 0, false];

[] Spawn 
{

	while {RACE_IN_PROGRESS} do
	{

		music_isPlaying = true;
		"Track_music" remoteExec ["playMusic", 0, false];

		waitUntil
		{

			uiSleep 5;

			not music_isPlaying

		};

	};

};

[] Spawn 
{

	while {RACE_IN_PROGRESS} do 
	{

	remoteExec ["NJP_Global_Fnc_Cleanup", 0];
	uiSleep 65;

	};

};

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart| : Completed Race init.";
diag_log format ["|Armakart| : Time for Race to init: %1.", diag_tickTime];
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";