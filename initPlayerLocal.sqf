if (didJIP) exitWith 
{

	[] Spawn 
	{

		uiSleep 1;

		player setDamage 1;

		uiSleep 2;

		{

		deleteVehicle _x;

		} forEach allDeadMen;

		hint "Sadly, Armakart doesn't support JIPs, enjoy watching the race in spectator.";

	};

};

//Initial client loadout
[] execVM "Armakart_Main\Armakart_Player_Loadouts\Farmer.sqf";

//Makes player/player vic invincible
player allowDamage false;
vehicle player allowDamage false;

//Setsup the variables
Current_Laps = 1;
initial_Lap = true;
Current_Checkpoint = 1;
Sub_Checkpoint_Number = 0;
No_item = true;

// NAMETAGS
[] execVM "Armakart_Main\Armakart_Whale's_Nametags\wha_nametags_init.sqf";

//Sets group name for spectator boys
_Name = name player;
[group player, [_Name]] remoteExec ["setGroupIdGlobal", 2];