/*
	Author: Njpatman

	Description:
		Banana Gun powerup, it's EXTREMELY JANK, but it works, need to find a better solution asap
*/
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
Initial_hint = true;
["Armakart", "MyKey", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Banana Gun Status:  </t><t color='#eef441'>Firing...</t>";
		_banana = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
		_banana_1 = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
		_banana_2 = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
		_banana_3 = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
		_banana_4 = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
		_banana_5 = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
		_banana_6 = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
		_banana_7 = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
		_bomb = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;
		_bomb_1 = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn; 
		_bomb_2 = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn; 
		_bomb_3 = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn; 
		_bomb_4 = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn; 
		_bomb_5 = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;
		_bomb_6 = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;
		_bomb_7 = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;

		{
		_x attachTo [vehicle player, [0,1.6,0.06]];
		_x setVectorDirAndUp [[0,0,0],[-100,-100,-100]];
		[_x, true] remoteExec ["hideObjectGlobal",0,true];
		} forEach [_bomb,_bomb_1,_bomb_2,_bomb_3,_bomb_4,_bomb_5,_bomb_6,_bomb_7];

		_banana attachTo [_bomb, [0,0,0.66]];
		_banana_1 attachTo [_bomb_1, [0,0,0.66]];
		_banana_2 attachTo [_bomb_2, [0,0,0.66]];
		_banana_3 attachTo [_bomb_3, [0,0,0.66]];
		_banana_4 attachTo [_bomb_4, [0,0,0.66]];
		_banana_5 attachTo [_bomb_5, [0,0,0.66]];
		_banana_6 attachTo [_bomb_6, [0,0,0.66]];
		_banana_7 attachTo [_bomb_7, [0,0,0.66]];

		{
		[_x, 1.5] remoteExec ["setObjectScale",0,true];
		} forEach [_banana,_banana_1,_banana_2,_banana_3,_banana_4,_banana_5,_banana_6,_banana_7];

		uiSleep 1.5;

		_vehicle = _bomb; 
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 125;
		playsound"toss";
		detach _bomb;
		_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_vel select 2)
		];
		uiSleep 0.3;
		_vehicle = _bomb_1; 
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 125;
		playsound"toss";
		detach _bomb_1;
		_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_vel select 2)
		];
		uiSleep 0.3;
		_vehicle = _bomb_2; 
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 125;
		playsound"toss";
		detach _bomb_2;
		_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_vel select 2)
		];
		uiSleep 0.3;
		_vehicle = _bomb_3; 
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 125;
		playsound"toss";
		detach _bomb_3;
		_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_vel select 2)
		];
		uiSleep 0.3;
		_vehicle = _bomb_4; 
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 125;
		playsound"toss";
		detach _bomb_4;
		_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_vel select 2)
		];
		uiSleep 0.3;	
		_vehicle = _bomb_5; 
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 125;
		playsound"toss";
		detach _bomb_5;
		_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_vel select 2)
		];
		uiSleep 0.3;	
		_vehicle = _bomb_6; 
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 125;
		playsound"toss";
		detach _bomb_6;
		_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_vel select 2)
		];
		uiSleep 0.3;	
		_vehicle = _bomb_7; 
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 125;
		playsound"toss";
		detach _bomb_7;
		_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_vel select 2)
		];
		hint parseText "<t>Banana Gun Status:  </t><t color='#ff0000'>Out Of HE Bananas</t>";
		No_item = true;
		uiSleep 0.8;
		{
		deleteVehicle _x;
		} forEach [_banana,_banana_1,_banana_2,_banana_3,_banana_4,_banana_5,_banana_6,_banana_7];
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Banana Gun Status:  </t><t color='#eef441'>Firing...</t>";
		_banana = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
		_banana_1 = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
		_banana_2 = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
		_banana_3 = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
		_banana_4 = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
		_banana_5 = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
		_banana_6 = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
		_banana_7 = createVehicle ["ACE_bananaItem", [0,0,0], [], 0, "NONE"];
		_bomb = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;
		_bomb_1 = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn; 
		_bomb_2 = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn; 
		_bomb_3 = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn; 
		_bomb_4 = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn; 
		_bomb_5 = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;
		_bomb_6 = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;
		_bomb_7 = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;

		{
		_x attachTo [vehicle player, [0,1.6,0.06]];
		_x setVectorDirAndUp [[0,0,0],[-100,-100,-100]];
		[_x, true] remoteExec ["hideObjectGlobal",0,true];
		} forEach [_bomb,_bomb_1,_bomb_2,_bomb_3,_bomb_4,_bomb_5,_bomb_6,_bomb_7];

		_banana attachTo [_bomb, [0,0,0.66]];
		_banana_1 attachTo [_bomb_1, [0,0,0.66]];
		_banana_2 attachTo [_bomb_2, [0,0,0.66]];
		_banana_3 attachTo [_bomb_3, [0,0,0.66]];
		_banana_4 attachTo [_bomb_4, [0,0,0.66]];
		_banana_5 attachTo [_bomb_5, [0,0,0.66]];
		_banana_6 attachTo [_bomb_6, [0,0,0.66]];
		_banana_7 attachTo [_bomb_7, [0,0,0.66]];

		{
		[_x, 1.5] remoteExec ["setObjectScale",0,true];
		} forEach [_banana,_banana_1,_banana_2,_banana_3,_banana_4,_banana_5,_banana_6,_banana_7];

		uiSleep 1.5;

		_vehicle = _bomb; 
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 125;
		playsound"toss";
		detach _bomb;
		_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_vel select 2)
		];
		uiSleep 0.3;
		_vehicle = _bomb_1; 
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 125;
		playsound"toss";
		detach _bomb_1;
		_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_vel select 2)
		];
		uiSleep 0.3;
		_vehicle = _bomb_2; 
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 125;
		playsound"toss";
		detach _bomb_2;
		_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_vel select 2)
		];
		uiSleep 0.3;
		_vehicle = _bomb_3; 
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 125;
		playsound"toss";
		detach _bomb_3;
		_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_vel select 2)
		];
		uiSleep 0.3;
		_vehicle = _bomb_4; 
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 125;
		playsound"toss";
		detach _bomb_4;
		_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_vel select 2)
		];
		uiSleep 0.3;	
		_vehicle = _bomb_5; 
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 125;
		playsound"toss";
		detach _bomb_5;
		_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_vel select 2)
		];
		uiSleep 0.3;	
		_vehicle = _bomb_6; 
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 125;
		playsound"toss";
		detach _bomb_6;
		_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_vel select 2)
		];
		uiSleep 0.3;	
		_vehicle = _bomb_7; 
		_vel = velocity _vehicle;
		_dir = direction _vehicle;
		_speed = 125;
		playsound"toss";
		detach _bomb_7;
		_vehicle setVelocity [
			(_vel select 0) + (sin _dir * _speed), 
			(_vel select 1) + (cos _dir * _speed), 
			(_vel select 2)
		];
		hint parseText "<t>Banana Gun Status:  </t><t color='#ff0000'>Out of HE Bananas</t>";
		No_item = true;
		uiSleep 0.8;
		{
		deleteVehicle _x;
		} forEach [_banana,_banana_1,_banana_2,_banana_3,_banana_4,_banana_5,_banana_6,_banana_7];
	};
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

[] Spawn {
	while {Initial_hint} do {
		hintsilent parseText "<t color='#FFFF00'>Banana Gun acquired!</t><br/><br/><t>Banana Gun Status:  </t><t color='#45f442'>Ready To Fire</t><br/><br/><t>The Banana Gun fires 8 HE bananas from the front of the kart.</t><br/><br/><t>[Default Keybind: F]</t>";
		uiSleep 0.05;
	};
};
playsound"hint";