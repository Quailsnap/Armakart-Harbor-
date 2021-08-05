/*
* 
* - Handles the creation and orbiting of the Pre-race camera
* 
*/

if (!hasInterface) exitwith {};

_Angle_Player_cam = random 360;

_pos = vehicle player;
_pos = [getPosATL _pos select 0, getPosATL _pos select 1, getPosATL _pos select 2];

_logic_pos = [(_pos select 0), (_pos select 1), (_pos select 2)];
_logic = createVehicleLocal ["Land_ClutterCutter_small_F", _logic_pos, [], 0, "CAN_COLLIDE"];

_logic setDir _Angle_Player_cam;
_camPos = [_pos select 0, _pos select 1, _pos select 2];

_cam = "camera" camCreate _camPos;
_cam camSetPos _camPos;
_cam camSetTarget _logic;
_cam camCommit 0;

waitUntil {camcommitted _cam};

_cam attachto [_logic, [0, 5.5, 6.2] ];
_cam cameraEffect ["internal", "BACK"];

// Handles the actual orbiting of the cam
while {PRE_RACE_PHASE} do
{

	_Angle_Player_cam = _Angle_Player_cam + 0.06;
	_Logic setDir _Angle_Player_cam;
	uiSleep 0.015;

};

camDestroy _cam;
deleteVehicle _logic;
deleteVehicle Arrow;