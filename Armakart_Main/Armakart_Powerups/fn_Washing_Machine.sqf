/*
	Author: Njpatman

	Description:
		Washing Machine powerup, simply launches a washing machine and spawns in 4 GBUs around it 
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
Initial_hint = true;
["Armakart", "MyKey", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Washing Machine Status:  </t><t color='#eef441'>Launching Forwards...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_bombier = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;
			_WM = "CUP_washing_machine" createvehicle position Powerup_Spawn;
			_WM allowDamage false;

			_smoke_1 = "SmokeShellRed" createVehicle position Powerup_Spawn;
			_smoke_1 attachTo [_WM, [0,0,0.5]];

			_bombier attachTo [vehicle player, [1,1,0.1]];
			_WM attachTo [_bombier, [0,0.5,0]];
			[_bombier, true] remoteExec ["hideObjectGlobal",0,true];
			_bombier setVectorDirAndUp [[0,0,0],[-100,-100,-100]];

			uiSleep 1.5;

			_vehicle = _bombier; 
			_vel = velocity _vehicle;
			_speed = 85;
			playsound"toss";
			detach _bombier;
			_dir = direction _vehicle;
			_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed),
			(_vel select 2)
			];

			No_item = true;
			hint parseText "<t>Washing Machine Status:  </t><t color='#ff0000'>Launched</t>";

			uiSleep 3.8;
			_bomb = "Bomb_03_F" createvehicle position Powerup_Spawn;

			_bomb attachTo [_WM, [0,6,4]];
			_bomb setVelocity [0,0,0];
			detach _bomb;
			uiSleep 1;

			_bomb_1 = "Bomb_03_F" createvehicle position Powerup_Spawn;

			_bomb_1 attachTo [_WM, [6,0,4]];
			_bomb_1 setVelocity [0,0,0];
			detach _bomb_1;
			uiSleep 1;

			_bomb_2 = "Bomb_03_F" createvehicle position Powerup_Spawn;

			_bomb_2 attachTo [_WM, [0,-6,4]];
			_bomb_2 setVelocity [0,0,0];
			detach _bomb_2;
			uiSleep 1;

			_bomb_3 = "Bomb_03_F" createvehicle position Powerup_Spawn;

			_bomb_3 attachTo [_WM, [-6,0,4]];
			_bomb_3 setVelocity [0,0,0];
			detach _bomb_3;
			uiSleep 1;

			deleteVehicle _WM;
			deleteVehicle _smoke_1;

		////////////////////////////////////////////////////////////////////////////////////////////////
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyRKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyRKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;


}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Washing Machine Status:  </t><t color='#eef441'>Launching Forwards...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_bombier = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;
			_WM = "CUP_washing_machine" createvehicle position Powerup_Spawn;
			_WM allowDamage false;

			_smoke_1 = "SmokeShellRed" createVehicle position Powerup_Spawn;
			_smoke_1 attachTo [_WM, [0,0,0.5]];

			_bombier attachTo [vehicle player, [1,1,0.1]];
			_WM attachTo [_bombier, [0,0.5,0]];
			[_bombier, true] remoteExec ["hideObjectGlobal",0,true];
			_bombier setVectorDirAndUp [[0,0,0],[-100,-100,-100]];

			uiSleep 1.5;

			_vehicle = _bombier; 
			_vel = velocity _vehicle;
			_speed = 85;
			playsound"toss";
			detach _bombier;
			_dir = direction _vehicle;
			_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed),
			(_vel select 2)
			];

			No_item = true;
			hint parseText "<t>Washing Machine Status:  </t><t color='#ff0000'>Launched</t>";

			uiSleep 3.8;
			_bomb = "Bomb_03_F" createvehicle position Powerup_Spawn;

			_bomb attachTo [_WM, [0,6,4]];
			_bomb setVelocity [0,0,0];
			detach _bomb;
			uiSleep 1;

			_bomb_1 = "Bomb_03_F" createvehicle position Powerup_Spawn;

			_bomb_1 attachTo [_WM, [6,0,4]];
			_bomb_1 setVelocity [0,0,0];
			detach _bomb_1;
			uiSleep 1;

			_bomb_2 = "Bomb_03_F" createvehicle position Powerup_Spawn;

			_bomb_2 attachTo [_WM, [0,-6,4]];
			_bomb_2 setVelocity [0,0,0];
			detach _bomb_2;
			uiSleep 1;

			_bomb_3 = "Bomb_03_F" createvehicle position Powerup_Spawn;

			_bomb_3 attachTo [_WM, [-6,0,4]];
			_bomb_3 setVelocity [0,0,0];
			detach _bomb_3;
			uiSleep 1;

			deleteVehicle _WM;
			deleteVehicle _smoke_1;

		////////////////////////////////////////////////////////////////////////////////////////////////
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyRKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyRKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;


}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyRKey", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Washing Machine Status:  </t><t color='#eef441'>Launching Backwards...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_bombier = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;
			_WM = "CUP_washing_machine" createvehicle position Powerup_Spawn;
			_WM allowDamage false;

			_smoke_1 = "SmokeShellRed" createVehicle position Powerup_Spawn;
			_smoke_1 attachTo [_WM, [0,0,0.5]];

			_bombier attachTo [vehicle player, [1,1,0.1]];
			_WM attachTo [_bombier, [0,0.5,0]];
			[_bombier, true] remoteExec ["hideObjectGlobal",0,true];
			_bombier setVectorDirAndUp [[0,0,0],[-100,-100,-100]];

			uiSleep 1.5;

			_vehicle = _bombier; 
			_vel = velocity _vehicle;
			_speed = 85;
			playsound"toss";
			detach _bombier;
			_dir = direction _vehicle;
			_vehicle setVelocity [
			(_vel select 0) + (sin (_dir - 180) * _speed), 
			(_vel select 1) + (cos (_dir - 180) * _speed),
			(_vel select 2)
			];

			No_item = true;
			hint parseText "<t>Washing Machine Status:  </t><t color='#ff0000'>Launched</t>";

			uiSleep 3.5;
			_bomb = "Bomb_03_F" createvehicle position Powerup_Spawn;

			_bomb attachTo [_WM, [0,6,4]];
			_bomb setVelocity [0,0,0];
			detach _bomb;
			uiSleep 1;

			_bomb_1 = "Bomb_03_F" createvehicle position Powerup_Spawn;

			_bomb_1 attachTo [_WM, [6,0,4]];
			_bomb_1 setVelocity [0,0,0];
			detach _bomb_1;
			uiSleep 1;

			_bomb_2 = "Bomb_03_F" createvehicle position Powerup_Spawn;

			_bomb_2 attachTo [_WM, [0,-6,4]];
			_bomb_2 setVelocity [0,0,0];
			detach _bomb_2;
			uiSleep 1;

			_bomb_3 = "Bomb_03_F" createvehicle position Powerup_Spawn;

			_bomb_3 attachTo [_WM, [-6,0,4]];
			_bomb_3 setVelocity [0,0,0];
			detach _bomb_3;
			uiSleep 1;

			deleteVehicle _WM;
			deleteVehicle _smoke_1;

		////////////////////////////////////////////////////////////////////////////////////////////////
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyRKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyRKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_R, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyRKeyButShift-er", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Washing Machine Status:  </t><t color='#eef441'>Launching Backwards...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_bombier = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;
			_WM = "CUP_washing_machine" createvehicle position Powerup_Spawn;
			_WM allowDamage false;

			_smoke_1 = "SmokeShellRed" createVehicle position Powerup_Spawn;
			_smoke_1 attachTo [_WM, [0,0,0.5]];

			_bombier attachTo [vehicle player, [1,1,0.1]];
			_WM attachTo [_bombier, [0,0.5,0]];
			[_bombier, true] remoteExec ["hideObjectGlobal",0,true];
			_bombier setVectorDirAndUp [[0,0,0],[-100,-100,-100]];

			uiSleep 1.5;

			_vehicle = _bombier; 
			_vel = velocity _vehicle;
			_speed = 85;
			playsound"toss";
			detach _bombier;
			_dir = direction _vehicle;
			_vehicle setVelocity [
			(_vel select 0) + (sin (_dir - 180) * _speed), 
			(_vel select 1) + (cos (_dir - 180) * _speed),
			(_vel select 2)
			];

			No_item = true;
			hint parseText "<t>Washing Machine Status:  </t><t color='#ff0000'>Launched</t>";

			uiSleep 3.5;
			_bomb = "Bomb_03_F" createvehicle position Powerup_Spawn;

			_bomb attachTo [_WM, [0,6,4]];
			_bomb setVelocity [0,0,0];
			detach _bomb;
			uiSleep 1;

			_bomb_1 = "Bomb_03_F" createvehicle position Powerup_Spawn;

			_bomb_1 attachTo [_WM, [6,0,4]];
			_bomb_1 setVelocity [0,0,0];
			detach _bomb_1;
			uiSleep 1;

			_bomb_2 = "Bomb_03_F" createvehicle position Powerup_Spawn;

			_bomb_2 attachTo [_WM, [0,-6,4]];
			_bomb_2 setVelocity [0,0,0];
			detach _bomb_2;
			uiSleep 1;

			_bomb_3 = "Bomb_03_F" createvehicle position Powerup_Spawn;

			_bomb_3 attachTo [_WM, [-6,0,4]];
			_bomb_3 setVelocity [0,0,0];
			detach _bomb_3;
			uiSleep 1;

			deleteVehicle _WM;
			deleteVehicle _smoke_1;

		////////////////////////////////////////////////////////////////////////////////////////////////
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyRKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyRKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_R, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

[] Spawn {
	while {Initial_hint} do {
		hintsilent parseText "<t color='#fc3903'>Washing Machine acquired!</t><br/><br/><t>Washing Machine Status:  </t><t color='#45f442'>Ready To Fire</t><br/><br/><t>The Washing Machine powerup spawns a washing machine that is launched to the front/back of your kart, and has a very powerful secondary cookoff after landing.</t><br/><br/><t>[Default Keybind: F]</t><br/><t>[Default Backward Keybind: R]</t>";
		uiSleep 0.05;
	};
};
playsound"hint";