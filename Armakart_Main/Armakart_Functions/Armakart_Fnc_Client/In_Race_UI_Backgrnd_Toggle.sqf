/*
* 
* - Adds a keybind so players can toggle the background for the in-race ui.
* 
*/ 


#include "\a3\ui_f\hpp\defineDIKCodes.inc"

["Armakart", "UI_Alt_KEY", "UI_Backgrnd_HIDE", {

	#define _Personal_UI_Background_1 uiNamespace getVariable [ "Personal_UI_Background_1", controlNull ]
	#define _Personal_UI_Background_2 uiNamespace getVariable [ "Personal_UI_Background_2", controlNull ]

	{
	_x ctrlSetBackgroundColor [-1,-1,-1,0];
	} forEach [_Personal_UI_Background_1, _Personal_UI_Background_2];

	["Armakart", "UI_Alt_KEY", "UI_Backgrnd_HIDE", {

		#define _Personal_UI_Background_1 uiNamespace getVariable [ "Personal_UI_Background_1", controlNull ]
		#define _Personal_UI_Background_2 uiNamespace getVariable [ "Personal_UI_Background_2", controlNull ]
		_UI_Color = profileNamespace getVariable "_UI_Color";

		{
		_x ctrlSetBackgroundColor _UI_Color;
		} forEach [_Personal_UI_Background_1, _Personal_UI_Background_2];

		call NJP_Client_Fnc_In_Race_UI_Backgrnd_Toggle;

	}, {""}, [DIK_U, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_U, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;