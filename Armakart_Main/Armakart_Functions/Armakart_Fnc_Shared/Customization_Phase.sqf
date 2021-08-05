/*
* 
* - Handles the Customization Phase UI & ACE Self Interact
* 
*/ 

if (!hasInterface) exitWith {};

//Creates Customization Menu
"Customization_Timer_Layer" cutRsc ["Customization_Timer_UI", "PLAIN"];
createDialog "Customization_Menu";

//Creates a small arrow local to the player then attaches it above the players kart so they can tell which cart is theirs
Arrow = "VR_3DSelector_01_default_F" createVehicleLocal [0,0,0];
Arrow attachto [vehicle player, [0, 0, 1.35] ];
Arrow setObjectScale 0.5;

//Creates Ace Self ineract to reset the UI
_Reset_Menu = ["Reset_Menu","<t color='#225985'>Reset Menu</t>","\a3\ui_f\data\IGUI\Cfg\holdactions\holdAction_hack_ca.paa",
{

	#define _Background_UI_1 uiNamespace getVariable [ "UI_Color_1", controlNull ]
	#define _Background_UI_2 uiNamespace getVariable [ "UI_Color_2", controlNull ]
	#define _Background_UI_3 uiNamespace getVariable [ "UI_Color_3", controlNull ]
	
	createDialog "Customization_Menu";

	_UI_Color = profileNamespace getVariable "_UI_Color";
	{
		_x ctrlSetBackgroundColor _UI_Color;
	} forEach [_Background_UI_1, _Background_UI_2, _Background_UI_3];

},{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _Reset_Menu] call ace_interact_menu_fnc_addActionToObject;

//Sets a random intiger between 1 - 12 so we can get it later if the player decides to click the button
_UI_Color_int = [1,10] call BIS_fnc_randomInt;

profileNamespace setVariable ["_UI_Color_int", _UI_Color_int];
profileNamespace setVariable ["_UI_Color", [0.133,0.349,0.522,0.65]];

call NJP_Client_Fnc_UI_Color;