/*
	Author: Njpatman

	Description:
		Miller Lite powerup, kill me
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
Initial_hint = true;
["Armakart", "MyKey", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Miller Lite Status:  </t><t color='#eef441'>Firing...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_group = createGroup CIVILIAN;
			_bomb = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;
			_Miller_Lite = _group createUnit ["B_CTRG_Miller_F", position Powerup_Spawn, [], 0, "FORM"];

			_Miller_Lite switchMove "TransAnimBase";
			_bomb attachTo [vehicle player, [1,1,0.2]];
			_Miller_Lite attachTo [_bomb, [0,-0.5,0]];
			[_bomb, true] remoteExec ["hideObjectGlobal",0,true];
			_bomb setVectorDirAndUp [[0,0,0],[-100,-100,-100]];
			[_Miller_Lite, 0.5] remoteExec ["setObjectScale",0,true];
			_spark_4 = "#particlesource" createVehicle (getPosATL _Miller_Lite);
			[_spark_4, [0, [0, 0, 0]]] remoteExec ["setParticleCircle",0,true];
			[_spark_4, [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0]] remoteExec ["setParticleRandom",0,true];
			[_spark_4, [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.5, [0, 0, 0], [0, 0, 0], 0, 20, 7.9, 0, [1, 1, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", _Miller_Lite]] remoteExec ["setParticleParams",0,true];
			[_spark_4, 0.005] remoteExec ["setDropInterval",0,true];

			uiSleep 2.4;
			hint parseText "<t>Miller Lite Status:  </t><t color='#ff0000'>Firing Complete</t>";
			No_item = true;

			_vehicle = _bomb; 
			_vel = velocity _vehicle;
			_dir = direction _vehicle;
			_speed = 68;
			playsound"toss";
			detach _bomb;
			_vehicle setVelocity [
				(_vel select 0) + (sin _dir * _speed), 
				(_vel select 1) + (cos _dir * _speed), 
				18
			];
			uiSleep 0.85;
			_Zap = _group createUnit ["ModuleLightning_F", getPos nearestObject [_Miller_Lite, Kart_Calssname], [], 0, "CAN_COLLIDE"];
			_kart = getPos _Miller_Lite nearestObject Kart_Calssname;
			[_kart,0] remoteexec ['setfuel', _kart];
			_spark = "#particlesource" createVehicle (getPosATL _kart);
			[_spark, [0, [0, 0, 0]]] remoteExec ["setParticleCircle",0,true];
			[_spark, [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0]] remoteExec ["setParticleRandom",0,true];
			[_spark, [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.5, [0, 0, 0], [0, 0, 0], 0, 20, 7.9, 0, [1, 1, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", _kart]] remoteExec ["setParticleParams",0,true];
			[_spark, 0.02] remoteExec ["setDropInterval",0,true];
			uiSleep 0.6;
			deleteVehicle _Zap;
			_Zap_2 = _group createUnit ["ModuleLightning_F", getPos nearestObject [_Miller_Lite, Kart_Calssname], [], 0, "CAN_COLLIDE"];
			_kart_2 = getPos _Miller_Lite nearestObject Kart_Calssname;
			[_kart_2,0] remoteexec ['setfuel', _kart_2];
			_spark_2 = "#particlesource" createVehicle (getPosATL _kart);
			[_spark_2, [0, [0, 0, 0]]] remoteExec ["setParticleCircle",0,true];
			[_spark_2, [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0]] remoteExec ["setParticleRandom",0,true];
			[_spark_2, [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.5, [0, 0, 0], [0, 0, 0], 0, 20, 7.9, 0, [1, 1, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", _kart]] remoteExec ["setParticleParams",0,true];
			[_spark_2, 0.02] remoteExec ["setDropInterval",0,true];
			uiSleep 0.6;
			deleteVehicle _Zap_2;
			_Zap_3 = _group createUnit ["ModuleLightning_F", getPos nearestObject [_Miller_Lite, Kart_Calssname], [], 0, "CAN_COLLIDE"];
			_kart_3 = getPos _Miller_Lite nearestObject Kart_Calssname;
			[_kart_3,0] remoteexec ['setfuel', _kart_3];
			_spark_3 = "#particlesource" createVehicle (getPosATL _kart);
			[_spark_3, [0, [0, 0, 0]]] remoteExec ["setParticleCircle",0,true];
			[_spark_3, [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0]] remoteExec ["setParticleRandom",0,true];
			[_spark_3, [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.5, [0, 0, 0], [0, 0, 0], 0, 20, 7.9, 0, [1, 1, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", _kart]] remoteExec ["setParticleParams",0,true];
			[_spark_3, 0.02] remoteExec ["setDropInterval",0,true];
			deleteVehicle _spark_4;
			uiSleep 0.2;
			deleteVehicle _Zap_3;
			uiSleep 5.6;
			[_kart,1] remoteexec ['setfuel', _kart];
			[_kart_2,1] remoteexec ['setfuel', _kart_2];
			[_kart_3,1] remoteexec ['setfuel', _kart_3];
			deleteVehicle _spark;
			deleteVehicle _spark_2;
			deleteVehicle _spark_3;
			deleteGroup _group;
			deleteVehicle _Miller_Lite;

		////////////////////////////////////////////////////////////////////////////////////////////////
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Miller Lite Status:  </t><t color='#eef441'>Launching...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_group = createGroup CIVILIAN;
			_bomb = "ammo_Bomb_SDB" createvehicle position Powerup_Spawn;
			_Miller_Lite = _group createUnit ["B_CTRG_Miller_F", position Powerup_Spawn, [], 0, "FORM"];

			_Miller_Lite switchMove "TransAnimBase";
			_bomb attachTo [vehicle player, [1,1,0.2]];
			_Miller_Lite attachTo [_bomb, [0,-0.5,0]];
			[_bomb, true] remoteExec ["hideObjectGlobal",0,true];
			_bomb setVectorDirAndUp [[0,0,0],[-100,-100,-100]];
			[_Miller_Lite, 0.5] remoteExec ["setObjectScale",0,true];
			_spark_4 = "#particlesource" createVehicle (getPosATL _Miller_Lite);
			[_spark_4, [0, [0, 0, 0]]] remoteExec ["setParticleCircle",0,true];
			[_spark_4, [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0]] remoteExec ["setParticleRandom",0,true];
			[_spark_4, [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.5, [0, 0, 0], [0, 0, 0], 0, 20, 7.9, 0, [1, 1, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", _Miller_Lite]] remoteExec ["setParticleParams",0,true];
			[_spark_4, 0.005] remoteExec ["setDropInterval",0,true];

			uiSleep 2.4;
			hint parseText "<t>Miller Lite Status:  </t><t color='#ff0000'>Launched</t>";
			No_item = true;

			_vehicle = _bomb; 
			_vel = velocity _vehicle;
			_dir = direction _vehicle;
			_speed = 68;
			playsound"toss";
			detach _bomb;
			_vehicle setVelocity [
				(_vel select 0) + (sin _dir * _speed), 
				(_vel select 1) + (cos _dir * _speed), 
				18
			];
			uiSleep 0.85;
			_Zap = _group createUnit ["ModuleLightning_F", getPos nearestObject [_Miller_Lite, Kart_Calssname], [], 0, "CAN_COLLIDE"];
			_kart = getPos _Miller_Lite nearestObject Kart_Calssname;
			[_kart,0] remoteexec ['setfuel', _kart];
			_spark = "#particlesource" createVehicle (getPosATL _kart);
			[_spark, [0, [0, 0, 0]]] remoteExec ["setParticleCircle",0,true];
			[_spark, [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0]] remoteExec ["setParticleRandom",0,true];
			[_spark, [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.5, [0, 0, 0], [0, 0, 0], 0, 20, 7.9, 0, [1, 1, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", _kart]] remoteExec ["setParticleParams",0,true];
			[_spark, 0.02] remoteExec ["setDropInterval",0,true];
			uiSleep 0.6;
			deleteVehicle _Zap;
			_Zap_2 = _group createUnit ["ModuleLightning_F", getPos nearestObject [_Miller_Lite, Kart_Calssname], [], 0, "CAN_COLLIDE"];
			_kart_2 = getPos _Miller_Lite nearestObject Kart_Calssname;
			[_kart_2,0] remoteexec ['setfuel', _kart_2];
			_spark_2 = "#particlesource" createVehicle (getPosATL _kart);
			[_spark_2, [0, [0, 0, 0]]] remoteExec ["setParticleCircle",0,true];
			[_spark_2, [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0]] remoteExec ["setParticleRandom",0,true];
			[_spark_2, [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.5, [0, 0, 0], [0, 0, 0], 0, 20, 7.9, 0, [1, 1, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", _kart]] remoteExec ["setParticleParams",0,true];
			[_spark_2, 0.02] remoteExec ["setDropInterval",0,true];
			uiSleep 0.6;
			deleteVehicle _Zap_2;
			_Zap_3 = _group createUnit ["ModuleLightning_F", getPos nearestObject [_Miller_Lite, Kart_Calssname], [], 0, "CAN_COLLIDE"];
			_kart_3 = getPos _Miller_Lite nearestObject Kart_Calssname;
			[_kart_3,0] remoteexec ['setfuel', _kart_3];
			_spark_3 = "#particlesource" createVehicle (getPosATL _kart);
			[_spark_3, [0, [0, 0, 0]]] remoteExec ["setParticleCircle",0,true];
			[_spark_3, [1, [0.05, 0.05, 0.1], [5, 5, 3], 0, 0.0025, [0, 0, 0, 0], 0, 0]] remoteExec ["setParticleRandom",0,true];
			[_spark_3, [["\A3\data_f\proxies\muzzle_flash\muzzle_flash_silencer.p3d", 1, 0, 1], "", "SpaceObject", 1, 1.5, [0, 0, 0], [0, 0, 0], 0, 20, 7.9, 0, [1, 1, 0.5], [[1, 1, 1, 1], [1, 1, 1, 1], [1, 1, 1, 0.5]], [0.08], 1, 0, "", "", _kart]] remoteExec ["setParticleParams",0,true];
			[_spark_3, 0.02] remoteExec ["setDropInterval",0,true];
			deleteVehicle _spark_4;
			uiSleep 0.2;
			deleteVehicle _Zap_3;
			uiSleep 5.6;
			[_kart,1] remoteexec ['setfuel', _kart];
			[_kart_2,1] remoteexec ['setfuel', _kart_2];
			[_kart_3,1] remoteexec ['setfuel', _kart_3];
			deleteVehicle _spark;
			deleteVehicle _spark_2;
			deleteVehicle _spark_3;
			deleteGroup _group;
			deleteVehicle _Miller_Lite;

		////////////////////////////////////////////////////////////////////////////////////////////////
	};
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

[] Spawn {
	while {Initial_hint} do {
		hintsilent parseText "<t color='#00FF00'>Miller Lite acquired!</t><br/><br/><t>Miller Lite Status:  </t><t color='#45f442'>Ready To Launch</t><br/><br/><t>Miller Lite is a small Miller that will fly in a arc from the front of your kart and zap 3 random people under it.</t><br/><br/><t>[Default Keybind: F]</t>";
		uiSleep 0.05;
	};
};
playsound"hint";