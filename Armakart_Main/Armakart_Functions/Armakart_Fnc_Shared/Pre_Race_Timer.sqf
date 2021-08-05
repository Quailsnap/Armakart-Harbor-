/*
* 
* - Adds a time to the players screen, which should give the rough time until the next phase or race start
* 
*/ 

//Access the timer control directly, removing the need for disableSerialization
#define Timer uiNamespace getVariable [ "TimerCtrl", controlNull ]

( "Timer" call BIS_fnc_rscLayer ) cutRsc ["Timer", "PLAIN"];
_color = "#45f442";//green

//default
_Time_left = 55;

while {_Time_left > 1} do {

	_Time_left = Pre_Race_Time - time;

	if (_Time_left < 21) then {_color = "#eef441";};//yellow

	if (_Time_left < 11) then {_color = "#ff0000";};//red

	Timer ctrlSetStructuredText parseText format ["<t align = 'center' size='1.85' font='LCD14' color='%1'>-- %2 --</t>", _color, [(_Time_left/3600),"HH:MM:SS"] call BIS_fnc_timetostring];

	uiSleep 1;

};

//Remove timer display
( "Timer" call BIS_fnc_rscLayer ) cutText ["", "PLAIN"];