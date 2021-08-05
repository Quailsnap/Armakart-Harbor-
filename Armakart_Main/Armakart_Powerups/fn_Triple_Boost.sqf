/*
	Author: Njpatman

	Description:
		Boost powerup, gives players a speed boost
*/

#include "\a3\ui_f\hpp\defineDIKCodes.inc"
Initial_hint = true;
["Armakart", "MyKey", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Boost 1 Status:  </t><t color='#eef441'>Boosting...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_Kart = vehicle player;
			_vel = velocity _Kart;
			_dir = direction _Kart;
			_speed = 18;
			playsound"turbo";
			[_Kart, [
				(_vel select 0) + (sin _dir * _speed), 
				(_vel select 1) + (cos _dir * _speed), 
				(_vel select 2)
			]] remoteexec ["setVelocity", _Kart];

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>Boost 1 Status:  </t><t color='#ff0000'>Boost Complete</t>";
		[] call NJP_Armakart_fnc_Boost_2;
	};
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;

["Armakart", "MyKeyButShift-er", "Powerup Action", {
	Initial_hint = false;
	[] Spawn {
		uiSleep 0.1;
		hintsilent parseText "<t>Boost 1 Status:  </t><t color='#eef441'>Boosting...</t>";
		////////////////////////////////////////////////////////////////////////////////////////////////

			_Kart = vehicle player;
			_vel = velocity _Kart;
			_dir = direction _Kart;
			_speed = 18;
			playsound"turbo";
			[_Kart, [
				(_vel select 0) + (sin _dir * _speed), 
				(_vel select 1) + (cos _dir * _speed), 
				(_vel select 2)
			]] remoteexec ["setVelocity", _Kart];

		////////////////////////////////////////////////////////////////////////////////////////////////
		hint parseText "<t>Boost 1 Status:  </t><t color='#ff0000'>Boost Complete</t>";
		[] call NJP_Armakart_fnc_Boost_2;
	};
	["Armakart", "MyKey", "Powerup Action", {""}, {""}, [DIK_F, [false, false, false]], false, 0, true] call CBA_fnc_addKeybind;
	["Armakart", "MyKeyButShift-er", "Powerup Action", {""}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

}, {""}, [DIK_F, [true, false, false]], false, 0, true] call CBA_fnc_addKeybind;

[] Spawn {
	while {Initial_hint} do {
		hintsilent parseText "<t color='#731717'>Triple Boost acquired!</t><br/><br/><t>Boost 1 Status:  </t><t color='#45f442'>Ready To Boost</t><br/><br/><t>The Triple Boost powerup will simply give you 3x Speed boosts, which you can trigger at your own volition.</t><br/><br/><t>[Default Keybind: F]</t>";
		uiSleep 0.05;
	};
};
playsound"hint";

