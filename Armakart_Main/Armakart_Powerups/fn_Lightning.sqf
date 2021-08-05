/*
	Author: Njpatman

	Description:
		Lightning powerup, life is a lie
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
Initial_hint = true;
["Armakart", "MyKey", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Lightning Status:  </t><t color='#eef441'>Zapping...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_Kart = getPos cursorTarget nearestObject Kart_Calssname;

			if !(_Kart isEqualTo vehicle player) exitwith 
			{
				_group = createGroup CIVILIAN;
				_Zap = _group createUnit ["ModuleLightning_F", getPos cursorTarget nearestObject Kart_Calssname, [], 0, "CAN_COLLIDE"];
				[_Kart,0] remoteexec ['setfuel', _Kart];
				_spark = "#particlesource" createVehicle (getPosASL _Kart);
				[_spark, [0, [0, 0, 0]]] remoteExec ["setParticleCircle",0,true];
				[_spark, [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0]] remoteExec ["setParticleRandom",0,true];
				[_spark, [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.5, [0, 0, 0], [0, 0, 0], 0, 20, 7.9, 0, [1, 1, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", _Kart]] remoteExec ["setParticleParams",0,true];
				[_spark, 0.005] remoteExec ["setDropInterval",0,true];
				uiSleep 0.5;
				deleteVehicle _Zap;
				hint parseText "<t>Lightning Status:  </t><t color='#ff0000'>Zap Complete</t>";
				No_item = true;
				"Crosshair_Layer" cutFadeOut 0.001;
				uiSleep 9.5;
				[_Kart,1] remoteexec ['setfuel', _Kart];
				deleteVehicle _Zap;
				deleteVehicle _spark;
				deleteGroup _group;
			};

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>Lightning Status:  </t><t color='#ff0000'>Zap Stopped, Player Kart Targeted</t>";
		No_item = true;
		"Crosshair_Layer" cutFadeOut 0.001;
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Lightning Status:  </t><t color='#eef441'>Zapping...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_Kart = getPos cursorTarget nearestObject Kart_Calssname;

			if !(_Kart isEqualTo vehicle player) exitwith 
			{
				_group = createGroup CIVILIAN;
				_Zap = _group createUnit ["ModuleLightning_F", getPos cursorTarget nearestObject Kart_Calssname, [], 0, "CAN_COLLIDE"];
				[_Kart,0] remoteexec ['setfuel', _Kart];
				_spark = "#particlesource" createVehicle (getPosASL _Kart);
				[_spark, [0, [0, 0, 0]]] remoteExec ["setParticleCircle",0,true];
				[_spark, [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0]] remoteExec ["setParticleRandom",0,true];
				[_spark, [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.5, [0, 0, 0], [0, 0, 0], 0, 20, 7.9, 0, [1, 1, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", _Kart]] remoteExec ["setParticleParams",0,true];
				[_spark, 0.005] remoteExec ["setDropInterval",0,true];
				uiSleep 0.5;
				deleteVehicle _Zap;
				hint parseText "<t>Lightning Status:  </t><t color='#ff0000'>Zap Complete</t>";
				No_item = true;
				"Crosshair_Layer" cutFadeOut 0.001;
				uiSleep 9.5;
				[_Kart,1] remoteexec ['setfuel', _Kart];
				deleteVehicle _Zap;
				deleteVehicle _spark;
				deleteGroup _group;
			};

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>Lightning Status:  </t><t color='#ff0000'>Zap Stopped, Player Kart Targeted</t>";
		No_item = true;
		"Crosshair_Layer" cutFadeOut 0.001;
	};
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

[] Spawn {
	while {Initial_hint} do {
		hintsilent parseText "<t color='#04378f'>Lightning acquired!</t><br/><br/><t>Lightning Status:  </t><t color='#45f442'>Ready To Zap</t><br/><br/><t>The Lightning powerup will disable the kart of the person under your corsshairs for a small period of time.</t><br/><br/><t>[Default Keybind: F]</t>";
		uiSleep 0.05;
	};
};
"Crosshair_Layer" cutRsc ["Crosshair", "PLAIN"];

#define _Crosshair_1 uiNamespace getVariable [ "Crosshair_1", controlNull ]
#define _Crosshair_2 uiNamespace getVariable [ "Crosshair_2", controlNull ]

//Gets the color value to the Crosshair
_UI_Color = profileNamespace getVariable "_UI_Color";

//Apllies the color value to the Crosshair
{
_x ctrlSetBackgroundColor _UI_Color;
} forEach [_Crosshair_1, _Crosshair_2];

playsound"hint";