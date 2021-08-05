/*
	Author: Njpatman

	Description:
		Bunny Mine powerup, Simply spawns a rabbit and attatches a large IED under it
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
Initial_hint = true;
["Armakart", "MyKey", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Bunny Mine Status:  </t><t color='#eef441'>Deploying...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			[] Spawn {
				_bomb = "ACE_IEDLandBig_Range_Ammo" createvehicle position Powerup_Spawn;
				_Bunny = createVehicle ["Rabbit_F", [0,0,0], [], 0, "NONE"];
				_Bunny attachTo [player, [0,-1.8,0.4]];
				detach _Bunny;
				_Bunny setVelocity [0,0,0];
				uiSleep 0.8;
				_bomb attachTo [_Bunny, [0,0,-0.15]];
				while {alive _bomb} do {};
				deleteVehicle _bomb;
				deleteVehicle _Bunny;
			};
		uiSleep 0.8;

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>Bunny Mine Status:  </t><t color='#ff0000'>Deployed</t>";
		playsound"hint";
		No_item = true;
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Bunny Mine Status:  </t><t color='#eef441'>Deploying...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			[] Spawn {
				_bomb = "ACE_IEDLandBig_Range_Ammo" createvehicle position Powerup_Spawn;
				_Bunny = createVehicle ["Rabbit_F", [0,0,0], [], 0, "NONE"];
				_Bunny attachTo [player, [0,-1.8,0.4]];
				detach _Bunny;
				_Bunny setVelocity [0,0,0];
				uiSleep 0.8;
				_bomb attachTo [_Bunny, [0,0,-0.15]];
				while {alive _bomb} do {};
				deleteVehicle _bomb;
				deleteVehicle _Bunny;
			};
		uiSleep 0.8;

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>Bunny Mine Status:  </t><t color='#ff0000'>Deployed</t>";
		playsound"hint";
		No_item = true;
	};
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

[] Spawn {
	while {Initial_hint} do {
		hintsilent parseText "<t color='#ff0d00'>Bunny Mine acquired!</t><br/><br/><t>Bunny Mine Status:  </t><t color='#45f442'>Ready To Deploy</t><br/><br/><t>The Bunny Mine is a VERY high explosive bunny that will launch anybody that drives over it too slowly.</t><br/><br/><t>[Default Keybind: F]</t>";
		uiSleep 0.05;
	};
};
playsound"hint";