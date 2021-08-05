/*
* 
* - Starts the race
* 
*/ 

//Shows in race UI
"In_Race_UI_Layer" cutRsc ["In_Race_UI", "PLAIN"];

//Sets plaver vic fuel to 0 just in case anyone jip'd 
call NJP_Global_Fnc_Set_All_Kart_Fuel_0;

if (hasInterface) then 
{

	//Starts checking players place (Have to spawn so the rest of the script executes)
	[] Spawn { call NJP_Client_Fnc_In_Race_UI; };

	//Controls for in race UI
	call NJP_Client_Fnc_In_Race_UI_Backgrnd_Toggle;

};

uiSleep 0.6;

//Display a countdown on players screen, with sfx to boot

playsound"start";

//5
["<t color='#ff0000' size='3'>5</t>",-1,-1,0.165,0,0,789] call BIS_fnc_dynamicText;

playMusic "";

//4
["<t color='#ff0000' size='3'>4</t>",-1,-1,0.165,0,0,789] call BIS_fnc_dynamicText;


playsound"start";
playsound"count";

//3
["<t color='#fcf403' size='3'>3</t>",-1,-1,0.165,0,0,789] call BIS_fnc_dynamicText;

//2
["<t color='#fcf403' size='3'>2</t>",-1,-1,0.165,0,0,789] call BIS_fnc_dynamicText;

//1
["<t color='#57de18' size='3'>1</t>",-1,-1,0.165,0,0,789] call BIS_fnc_dynamicText;

//Gets the show on a roll and lets player move
systemChat "|Armakart| : Begin the race!";
BEGUN_RACE = true;

//Sets players fuel to full
[vehicle player, 1] remoteexec ['setfuel',vehicle player];

//GO!
["<t color='#db9f07' size='4'>GO!</t>",-1,-1,0.165,0,0,789] call BIS_fnc_dynamicText;

//Creates the Ace Self Interact to reset to last chackpoint
_Reset_Checkpoint = ["Reset_Checkpoint","<t color='#731717'>RESET</t>","\a3\ui_f_oldman\data\IGUI\Cfg\holdactions\repair_ca.paa",
{

		//Creates vehicle for player, if the idiot got out
		if (isNull objectParent player) then
		{

			_veh = createVehicle [Kart_Calssname, getPosASL player, [], 0, "NONE"];

			player moveInDriver _veh;
			player allowDamage false;
			vehicle player allowDamage false;

		};

		//Gets players last checkpoint
		_CP = switch (Current_Checkpoint) do 
		{

			case 1: {CP_1};
			case 2: {CP_2};
			case 3: {CP_3};
			case 4: {CP_4};
			case 5: {CP_5};
			case 6: {CP_6};

		};

		//Teleports players in a randomly select position in a circle around the CP, as well as faces them the direction the CP is facing
		vehicle player setPosASL ((getPosASL _CP) vectorAdd ([[5,0,1], random 360] call BIS_fnc_rotateVector2D));

		//have to remoteExec for doubles
		[vehicle player, (getDir _CP)] remoteExec ['setDir', vehicle player];
		[vehicle player, (surfaceNormal position vehicle player)] remoteExec ['setVectorUp', vehicle player];

},{true}] call ace_interact_menu_fnc_createAction;

[player, 1, ["ACE_SelfActions"], _Reset_Checkpoint] call ace_interact_menu_fnc_addActionToObject;
