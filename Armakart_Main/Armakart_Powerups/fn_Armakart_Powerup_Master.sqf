/*
	Author: Njpatman

	Description:
		Selects a random powerup and plays a little hint animation that lasts as long as the sound effect
*/

if (No_item) then {
	No_item = false;
	Itembox_sfx = true;
	playsound"itembox";

	[] Spawn {
		while {Itembox_sfx} do {

			_Hintstr = selectRandom [

				"<t color='#808080'>Bomb</t>",
				"<t color='#948685'>Triple Bomb</t>",
				"<t color='#04378f'>Lightning</t>",
				"<t color='#11aed9'>Fus-Roh-Dah</t>",
				"<t color='#5c0c5e'>Smoke</t>",
				"<t color='#FFFF00'>Banana</t>",
				"<t color='#e68f0e'>Kitchen Sink</t>",
				"<t color='#ff0d00'>Bunny Mine</t>",
				"<t color='#FFFF00'>Triple Banana</t>",
				"<t color='#731717'>Triple Boost</t>",
				"<t color='#25910d'>Miller</t>",
				"<t color='#fc3903'>Washing Machine</t>",
				"<t color='#FFFF00'>Banana Gun</t>",
				"<t color='#cd7f32'>Checkpoint Teleport</t>",
				"<t color='#ff5454'>Involuntary Boost</t>",
				"<t color='#00FF00'>Miller Lite</t>",
				"<t color='#808080'>Bomb</t>",
				"<t color='#948685'>Triple Bomb</t>",
				"<t color='#04378f'>Lightning</t>",
				"<t color='#11aed9'>Fus-Roh-Dah</t>",
				"<t color='#FFFF00'>Triple Banana</t>",
				"<t color='#5c0c5e'>Smoke</t>",
				"<t color='#FFFF00'>Banana</t>",
				"<t color='#e68f0e'>Kitchen Sink</t>",
				"<t color='#ff0d00'>Bunny Mine</t>",
				"<t color='#731717'>Triple Boost</t>",
				"<t color='#25910d'>Miller</t>",
				"<t color='#fc3903'>Washing Machine</t>",
				"<t color='#FFFF00'>Banana Gun</t>",
				"<t color='#cd7f32'>Checkpoint Teleport</t>",
				"<t color='#ff5454'>Involuntary Boost</t>"

			];

			hintSilent parseText _Hintstr;

			uiSleep 0.12;
		};
	};

	_Count_Racers = count Places_Live;

	uiSleep 4.952;

	Itembox_sfx = false;
	uiSleep 0.125;
	hintSilent "";

	if (Powerup_Creep_Enabled isEqualTo 2) exitwith 
	{

		_Powerup = [1,17] call BIS_fnc_randomInt;

		switch (_Powerup) do
		{
			case 1 : { [] call NJP_Armakart_fnc_Bunny_IED; };
			case 2 : { [] call NJP_Armakart_fnc_Bomb; };
			case 3 : { [] call NJP_Armakart_fnc_Banana; };
			case 4 : { [] call NJP_Armakart_fnc_Involuntary_Boost; };
			case 5 : { [] call NJP_Armakart_fnc_Triple_Bomb; };
			case 6 : { [] call NJP_Armakart_fnc_Lightning; };
			case 7 : { [] call NJP_Armakart_fnc_Banana_Gun; };
			case 8 : { [] call NJP_Armakart_fnc_Smoke_Screen; };
			case 9 : { [] call NJP_Armakart_fnc_Triple_Boost; };
			case 10 : { [] call NJP_Armakart_fnc_Boost; };
			case 11 : { [] call NJP_Armakart_fnc_Triple_Banana; };
			case 12 : { [] call NJP_Armakart_fnc_Kitchen_sink; };
			case 13 : { [] call NJP_Armakart_fnc_Miller; };
			case 14 : { [] call NJP_Armakart_fnc_Washing_Machine; };
			case 15 : { [] call NJP_Armakart_fnc_Fus_Ro_Dah; };
			case 16 : { [] call NJP_Armakart_fnc_Miller_Lite; };
			case 17 : { [] call NJP_Armakart_fnc_CP_Tele; };
		};

	};

	//While I know this many if statements is frowned upon, a switch statement doesn't work from what I've tried so...

	if (Current_Place isEqualTo 1) exitwith 
	{

		_Powerup = [1,4] call BIS_fnc_randomInt;

		switch (_Powerup) do
		{
			case 1 : { [] call NJP_Armakart_fnc_Smoke_Screen; };
			case 2 : { [] call NJP_Armakart_fnc_Bunny_IED; };
			case 3 : { [] call NJP_Armakart_fnc_Bomb; };
			case 4 : { [] call NJP_Armakart_fnc_Banana; };
		};
	};

	if (Current_Place > 1 && Current_Place < (_Count_Racers * 0.2)) exitwith 
	{

		_Powerup = [1,12] call BIS_fnc_randomInt;

		switch (_Powerup) do
		{
			case 1 : { [] call NJP_Armakart_fnc_Bunny_IED; };
			case 2 : { [] call NJP_Armakart_fnc_Bomb; };
			case 3 : { [] call NJP_Armakart_fnc_Banana; };
			case 4 : { [] call NJP_Armakart_fnc_Involuntary_Boost; };
			case 5 : { [] call NJP_Armakart_fnc_Triple_Bomb; };
			case 6 : { [] call NJP_Armakart_fnc_Lightning; };
			case 7 : { [] call NJP_Armakart_fnc_Banana_Gun; };
			case 8 : { [] call NJP_Armakart_fnc_Smoke_Screen; };
			case 9 : { [] call NJP_Armakart_fnc_Triple_Boost; };
			case 10 : { [] call NJP_Armakart_fnc_Boost; };
			case 11 : { [] call NJP_Armakart_fnc_Triple_Banana; };
			case 12 : { [] call NJP_Armakart_fnc_Kitchen_sink; };
		}
	};

	if (Current_Place > (_Count_Racers * 0.2) && Current_Place < (_Count_Racers * 0.4)) exitwith 
	{

		_Powerup = [1,16] call BIS_fnc_randomInt;

		switch (_Powerup) do
		{
			case 1 : { [] call NJP_Armakart_fnc_Bunny_IED; };
			case 2 : { [] call NJP_Armakart_fnc_Bomb; };
			case 3 : { [] call NJP_Armakart_fnc_Banana; };
			case 4 : { [] call NJP_Armakart_fnc_Involuntary_Boost; };
			case 5 : { [] call NJP_Armakart_fnc_Triple_Bomb; };
			case 6 : { [] call NJP_Armakart_fnc_Lightning; };
			case 7 : { [] call NJP_Armakart_fnc_Banana_Gun; };
			case 8 : { [] call NJP_Armakart_fnc_Smoke_Screen; };
			case 9 : { [] call NJP_Armakart_fnc_Triple_Boost; };
			case 10 : { [] call NJP_Armakart_fnc_Boost; };
			case 11 : { [] call NJP_Armakart_fnc_Triple_Banana; };
			case 12 : { [] call NJP_Armakart_fnc_Kitchen_sink; };
			case 13 : { [] call NJP_Armakart_fnc_Miller; };
			case 14 : { [] call NJP_Armakart_fnc_Washing_Machine; };
			case 15 : { [] call NJP_Armakart_fnc_Fus_Ro_Dah; };
		};
	};

	if (Current_Place > (_Count_Racers * 0.4) && Current_Place < (_Count_Racers * 0.6) || Current_Place isEqualTo "N/A") exitwith 
	{
		_Powerup = [1,16] call BIS_fnc_randomInt;

		switch (_Powerup) do
		{
			case 1 : { [] call NJP_Armakart_fnc_Bunny_IED; };
			case 2 : { [] call NJP_Armakart_fnc_Bomb; };
			case 3 : { [] call NJP_Armakart_fnc_Banana; };
			case 4 : { [] call NJP_Armakart_fnc_Involuntary_Boost; };
			case 5 : { [] call NJP_Armakart_fnc_Triple_Bomb; };
			case 6 : { [] call NJP_Armakart_fnc_Lightning; };
			case 7 : { [] call NJP_Armakart_fnc_Banana_Gun; };
			case 8 : { [] call NJP_Armakart_fnc_Triple_Boost; };
			case 9 : { [] call NJP_Armakart_fnc_Triple_Boost; };
			case 10 : { [] call NJP_Armakart_fnc_Boost; };
			case 11 : { [] call NJP_Armakart_fnc_Boost; };
			case 12 : { [] call NJP_Armakart_fnc_Kitchen_sink; };
			case 13 : { [] call NJP_Armakart_fnc_Miller; };
			case 14 : { [] call NJP_Armakart_fnc_Washing_Machine; };
			case 15 : { [] call NJP_Armakart_fnc_Fus_Ro_Dah; };
			case 16 : { [] call NJP_Armakart_fnc_Miller_Lite; };
		};
	};

	if (Current_Place > (_Count_Racers * 0.6) && Current_Place < (_Count_Racers * 0.8)) exitwith 
	{

		_Powerup = [1,10] call BIS_fnc_randomInt;

		switch (_Powerup) do
		{
			case 1 : { [] call NJP_Armakart_fnc_Involuntary_Boost; };
			case 2 : { [] call NJP_Armakart_fnc_Triple_Bomb; };
			case 3 : { [] call NJP_Armakart_fnc_Lightning; };
			case 4 : { [] call NJP_Armakart_fnc_Triple_Boost; };
			case 5 : { [] call NJP_Armakart_fnc_Triple_Boost; };
			case 6 : { [] call NJP_Armakart_fnc_Boost; };
			case 7 : { [] call NJP_Armakart_fnc_Kitchen_sink; };
			case 8 : { [] call NJP_Armakart_fnc_Miller; };
			case 9 : { [] call NJP_Armakart_fnc_Fus_Ro_Dah; };
			case 10 : { [] call NJP_Armakart_fnc_CP_Tele; };
		};
	};

	if (Current_Place > (_Count_Racers * 0.8) && Current_Place isEqualTo _Count_Racers) exitwith 
	{

		_Powerup = [1,7] call BIS_fnc_randomInt;

		switch (_Powerup) do
		{
			case 1 : { [] call NJP_Armakart_fnc_Lightning; };
			case 2 : { [] call NJP_Armakart_fnc_Triple_Boost; };
			case 3 : { [] call NJP_Armakart_fnc_Triple_Boost; };
			case 4 : { [] call NJP_Armakart_fnc_CP_Tele; };
			case 5 : { [] call NJP_Armakart_fnc_Kitchen_sink; };
			case 6 : { [] call NJP_Armakart_fnc_Boost; };
			case 7 : { [] call NJP_Armakart_fnc_CP_Tele; };
		};
	};
};