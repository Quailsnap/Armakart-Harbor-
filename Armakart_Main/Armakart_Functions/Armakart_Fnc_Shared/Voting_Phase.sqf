/*
* 
* - Handles the Voting phase UI creation and deletion
* 
*/ 

#define _Voting_UI uiNamespace getVariable [ "Voting_UI", controlNull ]
#define _Bottom_Top uiNamespace getVariable [ "Bottom_Top", controlNull ]
#define _Timer_Title uiNamespace getVariable [ "Timer_Title", controlNull ]

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart| : Begun Voting Phase.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

//Removes Customization Menu Rest option
[player, 1,["ACE_SelfActions","Reset_Menu"]] call ace_interact_menu_fnc_removeActionFromObject;

//Closes Customization Menu
closeDialog 1234;

//Remove timer display
( "Timer" call BIS_fnc_rscLayer ) cutText ["", "PLAIN"];

//Creates the Voting screen
createDialog "Voting_Menu";

//Get the UI color that was used on the Customization UI and applies it
_UI_Color = profileNamespace getVariable "_UI_Color";
_Voting_UI ctrlSetBackgroundColor _UI_Color;

_Bottom_Top ctrlSetStructuredText parseText "<br/> <t align = 'center' size='1'>If you exit the menu, you will not be able to open it again!</t> <br/><br/> <t align = 'center' size='0.7'> The Voting Phase Timer will not be 100% accurate, but it should give you a good idea of when the Voting Phase will end.</t>";

_Timer_Title ctrlSetStructuredText parseText "<t align = 'center'  size='2'>--- Voting Time Left ---</t>";

uiSleep Voting_Phase_Time;

//Remove timer display
( "Timer" call BIS_fnc_rscLayer ) cutText ["", "PLAIN"];

//Closes Voting Menu
"Customization_Timer_Layer" cutFadeOut 0.001;
closeDialog 1235;

titleCut ["", "BLACK FADED", 150];

[] Spawn 
{

	[parseText "<t color='#c77518' size='1.15'>Race will begin soon, keep in mind that you have a GPS and MicroDAGR. Otherwise, good luck gents!</t>",-1,-1,6.5,0,0,800] call BIS_fnc_dynamicText;

};

uiSleep 7.5;

"dynamicBlur" ppEffectEnable true;   
"dynamicBlur" ppEffectAdjust [6];   
"dynamicBlur" ppEffectCommit 0;     
"dynamicBlur" ppEffectAdjust [0.0];  
"dynamicBlur" ppEffectCommit 3;  

titleCut ["", "BLACK IN", 3];

diag_log "//----------------------------------------------------------------------------\\";
diag_log "|Armakart| : Completed Voting Phase, applying weather/time to the server.";
diag_log format ["|Armakart FPS| : Current server FPS: %1.", diag_fps];
diag_log format ["|Armakart FPS| : Current minimal server FPS: %1.", diag_fpsMin];
diag_log "\\----------------------------------------------------------------------------//";

uiSleep 3;

PRE_RACE_PHASE = false;