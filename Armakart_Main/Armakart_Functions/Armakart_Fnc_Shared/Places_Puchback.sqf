/*
* 
* - Adds the player name and place to the "Places" Array to be fetched later at the places screen
* 
*/ 

Params ["_Name", "_Name_Dos"];

KARTS_FINISHED = KARTS_FINISHED + 1;

_KARTS_FINISHED_SUB = KARTS_FINISHED;

switch (_KARTS_FINISHED_SUB) do {

	case 1 : {_KARTS_FINISHED_SUB = '1st'};

	case 2 : {_KARTS_FINISHED_SUB = '2nd'};

	case 3 : {_KARTS_FINISHED_SUB = '3rd'};

	case 21 : {_KARTS_FINISHED_SUB = '21st'};

	case 22 : {_KARTS_FINISHED_SUB = '22nd'};

	case 23 : {_KARTS_FINISHED_SUB = '23rd'};

	case 31 : {_KARTS_FINISHED_SUB = '31st'};

	case 32 : {_KARTS_FINISHED_SUB = '32nd'};

	case 33 : {_KARTS_FINISHED_SUB = '33rd'};

	case 41 : {_KARTS_FINISHED_SUB = '41st'};

	case 42 : {_KARTS_FINISHED_SUB = '42nd'};

	case 43 : {_KARTS_FINISHED_SUB = '43rd'};

	case 51 : {_KARTS_FINISHED_SUB = '51st'};

	case 52 : {_KARTS_FINISHED_SUB = '52nd'};

	case 53 : {_KARTS_FINISHED_SUB = '53rd'};

	case 61 : {_KARTS_FINISHED_SUB = '61st'};

	case 62 : {_KARTS_FINISHED_SUB = '62nd'};

	case 63 : {_KARTS_FINISHED_SUB = '63rd'};

	case 71 : {_KARTS_FINISHED_SUB = '71st'};

	case 72 : {_KARTS_FINISHED_SUB = '72nd'};

	case 73 : {_KARTS_FINISHED_SUB = '73rd'};

	default {_KARTS_FINISHED_SUB = format ['%1th', _KARTS_FINISHED_SUB]};
	
};

if (isNil "_Name_Dos") then {

	Places pushBack format ["%1  -  %2", _KARTS_FINISHED_SUB, _Name];

} else {

	Places pushBack format ["%1  -  %2  &  %3", _KARTS_FINISHED_SUB, _Name_Dos, _Name];

};