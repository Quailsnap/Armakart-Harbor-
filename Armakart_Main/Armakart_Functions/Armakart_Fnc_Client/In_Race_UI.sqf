/*
* 
* - Outputs a players distance to sub checkpoint, sub checkpoint number, and Lap number he has that is then sorted to find a players rough place in the race, which is then used for the in-race ui and the powerup creep system
* 
*/

if (!hasInterface) exitwith {};

//GUI elements to edit
_Personal_UI_Places = uiNamespace getVariable [ 'Personal_UI_Places', controlNull ];
_Personal_UI_CPs = uiNamespace getVariable [ 'Personal_UI_CPs', controlNull ];
_Personal_UI_Laps = uiNamespace getVariable [ 'Personal_UI_Laps', controlNull ];

_Sub_CP_obj = FINISH_LINE;

Loc_Array = [Current_Laps, Sub_Checkpoint_Number, 0, player];

[Loc_Array] remoteExec ["NJP_ADD_PLAYER_ARRAY_TO_PLACES_ARRAY", -2, false];

While {RACE_IN_PROGRESS} do 
{

	if (player in (fullCrew [vehicle player, "driver", false] select 0)) then 
	{

		[Loc_Array] remoteExec ["NJP_DELETE_PLAYER_ARRAY_FROM_PLACES_ARRAY", -2, false];

		switch (Sub_Checkpoint_Number) do
		{

			case 0 : { _Sub_CP_obj = FINISH_LINE };
			case 1 : { _Sub_CP_obj = Sub_CP_1 };
			case 2 : { _Sub_CP_obj = Sub_CP_2 };
			case 3 : { _Sub_CP_obj = Sub_CP_3 };
			case 4 : { _Sub_CP_obj = Sub_CP_4 };
			case 5 : { _Sub_CP_obj = Sub_CP_5 };
			case 6 : { _Sub_CP_obj = Sub_CP_6 };
			case 7 : { _Sub_CP_obj = Sub_CP_7 };
			case 8 : { _Sub_CP_obj = Sub_CP_8 };
			case 9 : { _Sub_CP_obj = Sub_CP_9 };
			case 10 : { _Sub_CP_obj = Sub_CP_10 };
			case 11 : { _Sub_CP_obj = FINISH_LINE };

		};

		_dist = vehicle player distance _Sub_CP_obj;
		_dist_calc = _dist - (_dist * 2);
		Loc_Array = [Current_Laps, Sub_Checkpoint_Number, _dist_calc, player];

		[Loc_Array] remoteExec ["NJP_ADD_PLAYER_ARRAY_TO_PLACES_ARRAY", -2, false];

		//debug
		//hintsilent str Places_Live;

		uiSleep 2.4;

		Places_Live sort false;

		Current_Place = Places_Live find Loc_Array;

		Current_Place = Current_Place + 1;
	
	} else {

		Current_Place = "N/A";

	};

	switch (Current_Place) do 
	{

		case "N/A" : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText "<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='1.2'>N/A (Passenger)</t>";
		};
		case 1 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t color = '#FFD700' font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>1st</t><t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'> / %1</t>", count Places_Live];
		};
		case 2 : 
		{ 
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t color = '#C0C0C0' font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>2nd</t><t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'> / %1</t>", count Places_Live];
		};
		case 3 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t color = '#cd7f32' font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>3rd</t><t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'> / %1</t>", count Places_Live];
		};
		case 21 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>21st / %1</t>", count Places_Live];
		};
		case 22 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>22nd / %1</t>", count Places_Live];
		};
		case 23 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>23rd / %1</t>", count Places_Live];
		};
		case 31 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>31st / %1</t>", count Places_Live];
		};
		case 32 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>32nd / %1</t>", count Places_Live];
		};
		case 33 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>33rd / %1</t>", count Places_Live];
		};
		case 41 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>41st / %1</t>", count Places_Live];
		};
		case 42 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>42nd / %1</t>", count Places_Live];
		};
		case 43 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>43rd / %1</t>", count Places_Live];
		};
		case 51 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>51st / %1</t>", count Places_Live];
		};
		case 52 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>52nd / %1</t>", count Places_Live];
		};
		case 53 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>53rd / %1</t>", count Places_Live];
		};
		case 61 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>61st / %1</t>", count Places_Live];
		};
		case 62 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>62nd / %1</t>", count Places_Live];
		};
		case 63 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>63rd / %1</t>", count Places_Live];
		};
		case 71 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>71st / %1</t>", count Places_Live];
		};
		case 72 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>72nd / %1</t>", count Places_Live];
		};
		case 73 : 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>73rd / %1</t>", count Places_Live];
		};
		default 
		{
			_Personal_UI_Places ctrlSetStructuredText parseText format ["<t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>%1</t><t font='PuristaSemibold' align = 'center' valign = 'bottom' shadow='0' size='4.2'>th / %2</t>", Current_Place, count Places_Live];
		};

	};

	_Personal_UI_CPs ctrlSetStructuredText parseText format ["<t font='LCD14' align = 'center' valign = 'bottom' shadow='0' size='1.78'>%1/%2</t>", Current_Checkpoint, Checkpoints_number];

	_Personal_UI_Laps ctrlSetStructuredText parseText format ["<t font='LCD14' align = 'center' valign = 'bottom' shadow='0' size='1.78'>%1/%2</t>", Current_Laps, Laps_number];
	
};